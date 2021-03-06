// Generated by BUCKLESCRIPT VERSION 5.0.1, PLEASE EDIT WITH CARE

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as Fetch from "bs-fetch/src/Fetch.js";
import * as React from "react";
import * as Emotion from "bs-emotion/src/Emotion.bs.js";
import * as MaterialUi_Typography from "@jsiebern/bs-material-ui/src/MaterialUi_Typography.bs.js";
import * as Sync_bs$ReactTemplate from "./types/Sync_bs.bs.js";

function CitySummary(Props) {
  var cityName = Props.cityName;
  var match = React.useReducer((function (param, c) {
          return c;
        }), "Loading...");
  var setContent = match[1];
  React.useEffect((function () {
          fetch("https://cors-anywhere.herokuapp.com/https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&titles=" + cityName, Fetch.RequestInit[/* make */0](undefined, undefined, undefined, undefined, undefined, /* CORS */3, undefined, undefined, undefined, undefined, undefined)(/* () */0)).then((function (prim) {
                    return prim.json();
                  })).then((function (json) {
                  var match = Curry._1(Sync_bs$ReactTemplate.read_wikiMain, json);
                  var match$1 = match[/* query */0][/* pages */0];
                  if (match$1) {
                    Curry._1(setContent, match$1[0][1][/* extract */0]);
                  }
                  return Promise.resolve(/* () */0);
                }));
          return undefined;
        }));
  return React.createElement(MaterialUi_Typography.make, {
              children: match[0],
              className: Emotion.css(undefined, /* :: */[
                    Emotion.maxHeight(/* `calc */[
                          -1044768619,
                          /* tuple */[
                            /* sub */5745024,
                            Emotion.pct(100),
                            Emotion.px(264)
                          ]
                        ]),
                    /* :: */[
                      Emotion.padding(Emotion.px(10)),
                      /* :: */[
                        Emotion.overflowY(/* scroll */-949692403),
                        /* [] */0
                      ]
                    ]
                  ]),
              variant: /* Caption */-191243578
            });
}

var make = CitySummary;

export {
  make ,
  
}
/* react Not a pure module */
