let fetchImageUrl = (cityName: string, callback: option(string) => unit) => {
  let url =
    "https://pixabay.com/api/?q="
    ++ cityName
    ++ "&key=12165377-9c5309179e73242f5948443c3";
  Js.Promise.(
    Fetch.fetch(url)
    |> then_(Fetch.Response.json)
    |> then_(json => {
         callback(
           switch (Js.Json.decodeObject(json)) {
           | Some(obj) =>
             switch (obj->Js.Dict.get("hits")) {
             | Some(json) =>
               switch (Js.Json.decodeArray(json)) {
               | Some(arr) =>
                 arr
                 ->Belt.Array.get(0)
                 ->Belt.Option.flatMap(img =>
                     switch (Js.Json.decodeObject(img)) {
                     | Some(img) =>
                       switch (img->Js.Dict.get("largeImageURL")) {
                       | None => None
                       | Some(url) =>
                         switch (Js.Json.decodeString(url)) {
                         | None => None
                         | Some(url) => Some(url)
                         }
                       }
                     | None => None
                     }
                   )
               | None => None
               }
             | None => None
             }
           | None => None
           },
         );
         resolve();
       })
  )
  ->ignore;
};

let fetchCity = (cityName: string, callback: option(Data.city) => unit) => {
  let url =
    "https://nominatim.openstreetmap.org/search?city="
    ++ cityName
    ++ "&format=json&extratags=1&addressdetails=1&accept-language=en";
  Js.Promise.(
    Fetch.fetch(url)
    |> then_(Fetch.Response.json)
    |> then_(json => {
         fetchImageUrl(cityName, imageUrl =>
           callback(
             switch (Js.Json.decodeArray(json)) {
             | Some(arr) =>
               arr
               ->Belt.Array.get(0)
               ->Belt.Option.flatMap(city =>
                   switch (Js.Json.decodeObject(city)) {
                   | None => None
                   | Some(city) =>
                     city
                     ->Js.Dict.get("address")
                     ->Belt.Option.flatMap(address =>
                         switch (Js.Json.decodeObject(address)) {
                         | None => None
                         | Some(address) =>
                           switch (
                             city->Js.Dict.get("place_id"),
                             address->Js.Dict.get("city"),
                             address->Js.Dict.get("country"),
                             city->Js.Dict.get("lat"),
                             city->Js.Dict.get("lon"),
                           ) {
                           | (
                               Some(id),
                               Some(city),
                               Some(country),
                               Some(lat),
                               Some(lng),
                             ) =>
                             switch (
                               Js.Json.decodeNumber(id),
                               Js.Json.decodeString(country),
                               Js.Json.decodeString(city),
                               Js.Json.decodeString(lat),
                               Js.Json.decodeString(lng),
                             ) {
                             | (
                                 Some(id),
                                 Some(country),
                                 Some(city),
                                 Some(lat),
                                 Some(lng),
                               ) =>
                               Some(
                                 {
                                   id: id->Js.Float.toString,
                                   name: city,
                                   country,
                                   coordinates: {
                                     lat: lat->float_of_string,
                                     lng: lng->float_of_string,
                                   },
                                   image: {
                                     url: imageUrl,
                                     attribution: "",
                                     attributionUrl: None,
                                   },
                                 }: Data.city,
                               )
                             | _ => None
                             }
                           | _ => None
                           }
                         }
                       )
                   }
                 )
             | None => None
             },
           )
         );
         resolve();
       })
  )
  ->ignore;
};
