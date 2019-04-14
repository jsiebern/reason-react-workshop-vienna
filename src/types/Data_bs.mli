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

val read_image :  image Atdgen_codec_runtime.Decode.t

val write_image :  image Atdgen_codec_runtime.Encode.t

val read_coordinates :  coordinates Atdgen_codec_runtime.Decode.t

val write_coordinates :  coordinates Atdgen_codec_runtime.Encode.t

val read_city :  city Atdgen_codec_runtime.Decode.t

val write_city :  city Atdgen_codec_runtime.Encode.t

val read_cityArray :  cityArray Atdgen_codec_runtime.Decode.t

val write_cityArray :  cityArray Atdgen_codec_runtime.Encode.t

