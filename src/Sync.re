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
           switch (json->Sync_bs.read_imageOuter) {
           | {hits: Some([hit, ..._])} => Some(hit.largeImageURL)
           | _ => None
           },
         );
         resolve();
       })
  )
  ->ignore;
};

let fetchCity = (cityName: string, callback: option(Data_t.city) => unit) => {
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
             switch (json->Sync_bs.read_streetMain) {
             | [{place_id, lat, lng, address: Some({city, country})}, ..._] =>
               Some(
                 {
                   id: place_id->string_of_int,
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
                 }: Data_t.city,
               )
             | _ => None
             },
           )
         );
         resolve();
       })
  )
  ->ignore;
};