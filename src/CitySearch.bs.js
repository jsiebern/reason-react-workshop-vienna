// Generated by BUCKLESCRIPT VERSION 5.0.1, PLEASE EDIT WITH CARE

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as React from "react";
import * as MaterialUi_Grid from "@jsiebern/bs-material-ui/src/MaterialUi_Grid.bs.js";
import * as MaterialUi_Button from "@jsiebern/bs-material-ui/src/MaterialUi_Button.bs.js";
import * as Sync$ReactTemplate from "./Sync.bs.js";
import * as MaterialUi_TextField from "@jsiebern/bs-material-ui/src/MaterialUi_TextField.bs.js";

function CitySearch(Props) {
  var addCity = Props.addCity;
  var match = React.useReducer((function (param, t) {
          return t;
        }), "");
  var setText = match[1];
  var text = match[0];
  var goFetch = function (param) {
    Curry._1(setText, "");
    return Sync$ReactTemplate.fetchCity(text, (function (maybeCity) {
                  if (maybeCity !== undefined) {
                    return Curry._1(addCity, maybeCity);
                  } else {
                    return Curry._1(setText, text);
                  }
                }));
  };
  return React.createElement(MaterialUi_Grid.make, {
              children: null,
              container: true,
              spacing: /* V8 */1
            }, React.createElement(MaterialUi_Grid.make, {
                  children: React.createElement(MaterialUi_TextField.make, {
                        fullWidth: true,
                        inputProps: {
                          onKeyPress: (function ($$event) {
                              var match = $$event.charCode;
                              if (match !== 13) {
                                return /* () */0;
                              } else {
                                return goFetch(/* () */0);
                              }
                            })
                        },
                        onChange: (function ($$event) {
                            return Curry._1(setText, $$event.target.value);
                          }),
                        placeholder: "Enter City",
                        value: /* `String */[
                          -976970511,
                          text
                        ]
                      }),
                  item: true,
                  md: /* V8 */7
                }), React.createElement(MaterialUi_Grid.make, {
                  children: React.createElement(MaterialUi_Button.make, {
                        children: "Add",
                        color: /* Default */-384499551,
                        fullWidth: true,
                        variant: /* Outlined */-28821822,
                        onClick: (function (param) {
                            return goFetch(/* () */0);
                          })
                      }),
                  item: true,
                  md: /* V2 */1
                }));
}

var make = CitySearch;

export {
  make ,
  
}
/* react Not a pure module */
