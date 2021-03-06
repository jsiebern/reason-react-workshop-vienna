// Generated by BUCKLESCRIPT VERSION 5.0.1, PLEASE EDIT WITH CARE

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as Caml_format from "bs-platform/lib/es6/caml_format.js";
import * as Sync_bs$ReactTemplate from "./types/Sync_bs.bs.js";

function fetchImageUrl(cityName, callback) {
  var url = "https://pixabay.com/api/?q=" + (cityName + "&key=12165377-9c5309179e73242f5948443c3");
  fetch(url).then((function (prim) {
            return prim.json();
          })).then((function (json) {
          var match = Curry._1(Sync_bs$ReactTemplate.read_imageOuter, json);
          var match$1 = match[/* hits */0];
          var tmp;
          if (match$1 !== undefined) {
            var match$2 = match$1;
            tmp = match$2 ? match$2[0][/* largeImageURL */0] : undefined;
          } else {
            tmp = undefined;
          }
          Curry._1(callback, tmp);
          return Promise.resolve(/* () */0);
        }));
  return /* () */0;
}

function fetchCity(cityName, callback) {
  var url = "https://nominatim.openstreetmap.org/search?city=" + (cityName + "&format=json&extratags=1&addressdetails=1&accept-language=en");
  fetch(url).then((function (prim) {
            return prim.json();
          })).then((function (json) {
          fetchImageUrl(cityName, (function (imageUrl) {
                  var match = Curry._1(Sync_bs$ReactTemplate.read_streetMain, json);
                  var tmp;
                  if (match) {
                    var match$1 = match[0];
                    var match$2 = match$1[/* address */1];
                    if (match$2 !== undefined) {
                      var match$3 = match$2;
                      tmp = /* record */[
                        /* id */String(match$1[/* place_id */0]),
                        /* name */match$3[/* city */0],
                        /* country */match$3[/* country */1],
                        /* coordinates : record */[
                          /* lat */Caml_format.caml_float_of_string(match$1[/* lat */2]),
                          /* lng */Caml_format.caml_float_of_string(match$1[/* lng */3])
                        ],
                        /* image : record */[
                          /* url */imageUrl,
                          /* attribution */"",
                          /* attributionUrl */undefined
                        ]
                      ];
                    } else {
                      tmp = undefined;
                    }
                  } else {
                    tmp = undefined;
                  }
                  return Curry._1(callback, tmp);
                }));
          return Promise.resolve(/* () */0);
        }));
  return /* () */0;
}

export {
  fetchImageUrl ,
  fetchCity ,
  
}
/* Sync_bs-ReactTemplate Not a pure module */
