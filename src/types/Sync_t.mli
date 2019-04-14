(* Auto-generated from "Sync.atd" *)
              [@@@ocaml.warning "-27-32-35-39"]

type wikiPage = { extract: string }

type wikiQuery = { pages: (string * wikiPage) list }

type wikiMain = { query: wikiQuery }

type streetAddress = { city: string; country: string }

type city = {
  place_id: int;
  address: streetAddress option;
  lat: string;
  lng: string
}

type streetMain = city list

type imageHit = { largeImageURL: string }

type imageOuter = { hits: imageHit list option }
