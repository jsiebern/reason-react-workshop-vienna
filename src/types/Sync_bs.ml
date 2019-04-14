(* Auto-generated from "Sync.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type wikiPage = Sync_t.wikiPage = { extract: string }

type wikiQuery = Sync_t.wikiQuery = { pages: (string * wikiPage) list }

type wikiMain = Sync_t.wikiMain = { query: wikiQuery }

type streetAddress = Sync_t.streetAddress = { city: string; country: string }

type city = Sync_t.city = {
  place_id: int;
  address: streetAddress option;
  lat: string;
  lng: string
}

type streetMain = Sync_t.streetMain

type imageHit = Sync_t.imageHit = { largeImageURL: string }

type imageOuter = Sync_t.imageOuter = { hits: imageHit list option }

let write_wikiPage = (
  Atdgen_codec_runtime.Encode.make (fun (t : wikiPage) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"extract"
          t.extract
      ]
    )
  )
)
let read_wikiPage = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          extract =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "extract"
            ) json;
      } : wikiPage)
    )
  )
)
let write__5 = (
  Atdgen_codec_runtime.Encode.make (fun (t : _) ->
    t |>
    List.map (
      fun (key, value) ->
        Atdgen_codec_runtime.Encode.field
          (
            write_wikiPage
          )
          ~name:key
          value
    ) |>
    Atdgen_codec_runtime.Encode.obj
  )
)
let read__5 = (
  Atdgen_codec_runtime.Decode.obj_list (
    read_wikiPage
  )
)
let write_wikiQuery = (
  Atdgen_codec_runtime.Encode.make (fun (t : wikiQuery) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write__5
            )
          ~name:"pages"
          t.pages
      ]
    )
  )
)
let read_wikiQuery = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          pages =
            Atdgen_codec_runtime.Decode.decode
            (
              read__5
              |> Atdgen_codec_runtime.Decode.field "pages"
            ) json;
      } : wikiQuery)
    )
  )
)
let write_wikiMain = (
  Atdgen_codec_runtime.Encode.make (fun (t : wikiMain) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            write_wikiQuery
            )
          ~name:"query"
          t.query
      ]
    )
  )
)
let read_wikiMain = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          query =
            Atdgen_codec_runtime.Decode.decode
            (
              read_wikiQuery
              |> Atdgen_codec_runtime.Decode.field "query"
            ) json;
      } : wikiMain)
    )
  )
)
let write_streetAddress = (
  Atdgen_codec_runtime.Encode.make (fun (t : streetAddress) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"city"
          t.city
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"country"
          t.country
      ]
    )
  )
)
let read_streetAddress = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          city =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "city"
            ) json;
          country =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "country"
            ) json;
      } : streetAddress)
    )
  )
)
let write__3 = (
  Atdgen_codec_runtime.Encode.option_as_constr (
    write_streetAddress
  )
)
let read__3 = (
  Atdgen_codec_runtime.Decode.option_as_constr (
    read_streetAddress
  )
)
let write_city = (
  Atdgen_codec_runtime.Encode.make (fun (t : city) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.int
            )
          ~name:"place_id"
          t.place_id
        ;
          Atdgen_codec_runtime.Encode.field_o
            (
            write_streetAddress
            )
          ~name:"address"
          t.address
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"lat"
          t.lat
        ;
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"lon"
          t.lng
      ]
    )
  )
)
let read_city = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          place_id =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.int
              |> Atdgen_codec_runtime.Decode.field "place_id"
            ) json;
          address =
            Atdgen_codec_runtime.Decode.decode
            (
              read_streetAddress
              |> Atdgen_codec_runtime.Decode.fieldOptional "address"
            ) json;
          lat =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "lat"
            ) json;
          lng =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "lon"
            ) json;
      } : city)
    )
  )
)
let write__4 = (
  Atdgen_codec_runtime.Encode.list (
    write_city
  )
)
let read__4 = (
  Atdgen_codec_runtime.Decode.list (
    read_city
  )
)
let write_streetMain = (
  write__4
)
let read_streetMain = (
  read__4
)
let write_imageHit = (
  Atdgen_codec_runtime.Encode.make (fun (t : imageHit) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field
            (
            Atdgen_codec_runtime.Encode.string
            )
          ~name:"largeImageURL"
          t.largeImageURL
      ]
    )
  )
)
let read_imageHit = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          largeImageURL =
            Atdgen_codec_runtime.Decode.decode
            (
              Atdgen_codec_runtime.Decode.string
              |> Atdgen_codec_runtime.Decode.field "largeImageURL"
            ) json;
      } : imageHit)
    )
  )
)
let write__1 = (
  Atdgen_codec_runtime.Encode.list (
    write_imageHit
  )
)
let read__1 = (
  Atdgen_codec_runtime.Decode.list (
    read_imageHit
  )
)
let write__2 = (
  Atdgen_codec_runtime.Encode.option_as_constr (
    write__1
  )
)
let read__2 = (
  Atdgen_codec_runtime.Decode.option_as_constr (
    read__1
  )
)
let write_imageOuter = (
  Atdgen_codec_runtime.Encode.make (fun (t : imageOuter) ->
    (
    Atdgen_codec_runtime.Encode.obj
      [
          Atdgen_codec_runtime.Encode.field_o
            (
            write__1
            )
          ~name:"hits"
          t.hits
      ]
    )
  )
)
let read_imageOuter = (
  Atdgen_codec_runtime.Decode.make (fun json ->
    (
      ({
          hits =
            Atdgen_codec_runtime.Decode.decode
            (
              read__1
              |> Atdgen_codec_runtime.Decode.fieldOptional "hits"
            ) json;
      } : imageOuter)
    )
  )
)
