(* Auto-generated from "Data.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type image = {
  url: string option;
  attribution: string;
  attributionUrl: string option
}

type coordinates = { lat: float; lng: float }

type city = {
  id: string;
  name: string;
  country: string;
  coordinates: coordinates;
  image: image
}

type cityArray = city Atdgen_runtime.Util.ocaml_array option
