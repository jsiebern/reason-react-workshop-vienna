(* Auto-generated from "Data.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type image = Data_t.image = {
  url: string option;
  attribution: string;
  attributionUrl: string option
}

type coordinates = Data_t.coordinates = { lat: float; lng: float }

type city = Data_t.city = {
  id: string;
  name: string;
  country: string;
  coordinates: coordinates;
  image: image
}

type cityArray = Data_t.cityArray

let write__1 = (
  Atdgen_codec_runtime.Encode.option_as_constr (
    Atdgen_codec_runtime.Encode.string
  )
)
let read__1 = (
  Atdgen_codec_runtime.Decode.option_as_constr (
    Atdgen_codec_runtime.Decode.string
  )
)
let write_image = (
  Atdgen_codec_runtime.Encode.make (fun (t : image) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write__1
            )
          ~name:"url"
          t.url
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"attribution"
          t.attribution
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write__1
            )
          ~name:"attributionUrl"
          t.attributionUrl
      ]
    )
  )
)
let read_image = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          url =
            Atdgen_codec_runtime.Decode.decode
            (
              read__1
              |> Atdgen_codec_runtime.Decode.field "url"
            ) json;
          attribution =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "attribution"
            ) json;
          attributionUrl =
            Atdgen_codec_runtime.Decode.decode
            (
              read__1
              |> Atdgen_codec_runtime.Decode.field "attributionUrl"
            ) json;
      } : image)
    )
  )
)
let write_coordinates = (
  Atdgen_codec_runtime.Encode.make (fun (t : coordinates) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.float
            )
          ~name:"lat"
          t.lat
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.float
            )
          ~name:"lng"
          t.lng
      ]
    )
  )
)
let read_coordinates = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          lat =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.float
              |> Atdgen_codec_runtime.Decode.field "lat"
            ) json;
          lng =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.float
              |> Atdgen_codec_runtime.Decode.field "lng"
            ) json;
      } : coordinates)
    )
  )
)
let write_city = (
  Atdgen_codec_runtime.Encode.make (fun (t : city) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"id"
          t.id
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"name"
          t.name
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"country"
          t.country
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_coordinates
            )
          ~name:"coordinates"
          t.coordinates
        ;
          Atdgen_codec_runtime.Encode.field
            (
            write_image
            )
          ~name:"image"
          t.image
      ]
    )
  )
)
let read_city = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          id =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "id"
            ) json;
          name =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "name"
            ) json;
          country =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "country"
            ) json;
          coordinates =
            Atdgen_codec_runtime.Decode.decode
            (
              read_coordinates
              |> Atdgen_codec_runtime.Decode.field "coordinates"
            ) json;
          image =
            Atdgen_codec_runtime.Decode.decode
            (
              read_image
              |> Atdgen_codec_runtime.Decode.field "image"
            ) json;
      } : city)
    )
  )
)
let write__2 = (
  Atdgen_codec_runtime.Encode.array (
    write_city
  )
)
let read__2 = (
  Atdgen_codec_runtime.Decode.array (
    read_city
  )
)
let write__3 = (
  Atdgen_codec_runtime.Encode.option_as_constr (
    write__2
  )
)
let read__3 = (
  Atdgen_codec_runtime.Decode.option_as_constr (
    read__2
  )
)
let write_cityArray = (
  write__3
)
let read_cityArray = (
  read__3
)
