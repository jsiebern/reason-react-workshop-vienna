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

val read_wikiPage :  wikiPage Atdgen_codec_runtime.Decode.t

val write_wikiPage :  wikiPage Atdgen_codec_runtime.Encode.t

val read_wikiQuery :  wikiQuery Atdgen_codec_runtime.Decode.t

val write_wikiQuery :  wikiQuery Atdgen_codec_runtime.Encode.t

val read_wikiMain :  wikiMain Atdgen_codec_runtime.Decode.t

val write_wikiMain :  wikiMain Atdgen_codec_runtime.Encode.t

val read_streetAddress :  streetAddress Atdgen_codec_runtime.Decode.t

val write_streetAddress :  streetAddress Atdgen_codec_runtime.Encode.t

val read_city :  city Atdgen_codec_runtime.Decode.t

val write_city :  city Atdgen_codec_runtime.Encode.t

val read_streetMain :  streetMain Atdgen_codec_runtime.Decode.t

val write_streetMain :  streetMain Atdgen_codec_runtime.Encode.t

val read_imageHit :  imageHit Atdgen_codec_runtime.Decode.t

val write_imageHit :  imageHit Atdgen_codec_runtime.Encode.t

val read_imageOuter :  imageOuter Atdgen_codec_runtime.Decode.t

val write_imageOuter :  imageOuter Atdgen_codec_runtime.Encode.t

