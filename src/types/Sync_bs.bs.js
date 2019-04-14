// Generated by BUCKLESCRIPT VERSION 5.0.1, PLEASE EDIT WITH CARE

import * as List from "bs-platform/lib/es6/list.js";
import * as Atdgen_codec_runtime from "@ahrefs/bs-atdgen-codec-runtime/src/atdgen_codec_runtime.bs.js";

var write_wikiPage = Atdgen_codec_runtime.Encode[/* make */0]((function (t) {
        return Atdgen_codec_runtime.Encode[/* obj */14](/* :: */[
                    Atdgen_codec_runtime.Encode[/* field */12](undefined, Atdgen_codec_runtime.Encode[/* string */3], "extract", t[/* extract */0]),
                    /* [] */0
                  ]);
      }));

var read_wikiPage = Atdgen_codec_runtime.Decode[/* make */0]((function (json) {
        var partial_arg = Atdgen_codec_runtime.Decode[/* string */7];
        var partial_arg$1 = Atdgen_codec_runtime.Decode[/* field */15];
        return /* record */[/* extract */Atdgen_codec_runtime.Decode[/* decode */1]((function (param) {
                        return partial_arg$1("extract", partial_arg, param);
                      }), json)];
      }));

var write__5 = Atdgen_codec_runtime.Encode[/* make */0]((function (t) {
        return Atdgen_codec_runtime.Encode[/* obj */14](List.map((function (param) {
                          return Atdgen_codec_runtime.Encode[/* field */12](undefined, write_wikiPage, param[0], param[1]);
                        }), t));
      }));

var partial_arg = Atdgen_codec_runtime.Decode[/* obj_list */13];

function read__5(param) {
  return partial_arg(read_wikiPage, param);
}

var write_wikiQuery = Atdgen_codec_runtime.Encode[/* make */0]((function (t) {
        return Atdgen_codec_runtime.Encode[/* obj */14](/* :: */[
                    Atdgen_codec_runtime.Encode[/* field */12](undefined, write__5, "pages", t[/* pages */0]),
                    /* [] */0
                  ]);
      }));

var read_wikiQuery = Atdgen_codec_runtime.Decode[/* make */0]((function (json) {
        var partial_arg = Atdgen_codec_runtime.Decode[/* field */15];
        return /* record */[/* pages */Atdgen_codec_runtime.Decode[/* decode */1]((function (param) {
                        return partial_arg("pages", read__5, param);
                      }), json)];
      }));

var write_wikiMain = Atdgen_codec_runtime.Encode[/* make */0]((function (t) {
        return Atdgen_codec_runtime.Encode[/* obj */14](/* :: */[
                    Atdgen_codec_runtime.Encode[/* field */12](undefined, write_wikiQuery, "query", t[/* query */0]),
                    /* [] */0
                  ]);
      }));

var read_wikiMain = Atdgen_codec_runtime.Decode[/* make */0]((function (json) {
        var partial_arg = Atdgen_codec_runtime.Decode[/* field */15];
        return /* record */[/* query */Atdgen_codec_runtime.Decode[/* decode */1]((function (param) {
                        return partial_arg("query", read_wikiQuery, param);
                      }), json)];
      }));

var write_streetAddress = Atdgen_codec_runtime.Encode[/* make */0]((function (t) {
        return Atdgen_codec_runtime.Encode[/* obj */14](/* :: */[
                    Atdgen_codec_runtime.Encode[/* field */12](undefined, Atdgen_codec_runtime.Encode[/* string */3], "city", t[/* city */0]),
                    /* :: */[
                      Atdgen_codec_runtime.Encode[/* field */12](undefined, Atdgen_codec_runtime.Encode[/* string */3], "country", t[/* country */1]),
                      /* [] */0
                    ]
                  ]);
      }));

var read_streetAddress = Atdgen_codec_runtime.Decode[/* make */0]((function (json) {
        var partial_arg = Atdgen_codec_runtime.Decode[/* string */7];
        var partial_arg$1 = Atdgen_codec_runtime.Decode[/* field */15];
        var partial_arg$2 = Atdgen_codec_runtime.Decode[/* string */7];
        var partial_arg$3 = Atdgen_codec_runtime.Decode[/* field */15];
        return /* record */[
                /* city */Atdgen_codec_runtime.Decode[/* decode */1]((function (param) {
                        return partial_arg$1("city", partial_arg, param);
                      }), json),
                /* country */Atdgen_codec_runtime.Decode[/* decode */1]((function (param) {
                        return partial_arg$3("country", partial_arg$2, param);
                      }), json)
              ];
      }));

Atdgen_codec_runtime.Decode[/* option_as_constr */25](read_streetAddress);

var write_city = Atdgen_codec_runtime.Encode[/* make */0]((function (t) {
        return Atdgen_codec_runtime.Encode[/* obj */14](/* :: */[
                    Atdgen_codec_runtime.Encode[/* field */12](undefined, Atdgen_codec_runtime.Encode[/* int */5], "place_id", t[/* place_id */0]),
                    /* :: */[
                      Atdgen_codec_runtime.Encode[/* field_o */13](undefined, write_streetAddress, "address", t[/* address */1]),
                      /* :: */[
                        Atdgen_codec_runtime.Encode[/* field */12](undefined, Atdgen_codec_runtime.Encode[/* string */3], "lat", t[/* lat */2]),
                        /* :: */[
                          Atdgen_codec_runtime.Encode[/* field */12](undefined, Atdgen_codec_runtime.Encode[/* string */3], "lon", t[/* lng */3]),
                          /* [] */0
                        ]
                      ]
                    ]
                  ]);
      }));

var read_city = Atdgen_codec_runtime.Decode[/* make */0]((function (json) {
        var partial_arg = Atdgen_codec_runtime.Decode[/* int */4];
        var partial_arg$1 = Atdgen_codec_runtime.Decode[/* field */15];
        var partial_arg$2 = Atdgen_codec_runtime.Decode[/* string */7];
        var partial_arg$3 = Atdgen_codec_runtime.Decode[/* field */15];
        var partial_arg$4 = Atdgen_codec_runtime.Decode[/* string */7];
        var partial_arg$5 = Atdgen_codec_runtime.Decode[/* field */15];
        return /* record */[
                /* place_id */Atdgen_codec_runtime.Decode[/* decode */1]((function (param) {
                        return partial_arg$1("place_id", partial_arg, param);
                      }), json),
                /* address */Atdgen_codec_runtime.Decode[/* decode */1](Atdgen_codec_runtime.Decode[/* fieldOptional */17]("address", read_streetAddress), json),
                /* lat */Atdgen_codec_runtime.Decode[/* decode */1]((function (param) {
                        return partial_arg$3("lat", partial_arg$2, param);
                      }), json),
                /* lng */Atdgen_codec_runtime.Decode[/* decode */1]((function (param) {
                        return partial_arg$5("lon", partial_arg$4, param);
                      }), json)
              ];
      }));

var partial_arg$1 = Atdgen_codec_runtime.Encode[/* list */8];

function write__4(param) {
  return partial_arg$1(write_city, param);
}

var partial_arg$2 = Atdgen_codec_runtime.Decode[/* list */11];

function read__4(param) {
  return partial_arg$2(read_city, param);
}

var write_imageHit = Atdgen_codec_runtime.Encode[/* make */0]((function (t) {
        return Atdgen_codec_runtime.Encode[/* obj */14](/* :: */[
                    Atdgen_codec_runtime.Encode[/* field */12](undefined, Atdgen_codec_runtime.Encode[/* string */3], "largeImageURL", t[/* largeImageURL */0]),
                    /* [] */0
                  ]);
      }));

var read_imageHit = Atdgen_codec_runtime.Decode[/* make */0]((function (json) {
        var partial_arg = Atdgen_codec_runtime.Decode[/* string */7];
        var partial_arg$1 = Atdgen_codec_runtime.Decode[/* field */15];
        return /* record */[/* largeImageURL */Atdgen_codec_runtime.Decode[/* decode */1]((function (param) {
                        return partial_arg$1("largeImageURL", partial_arg, param);
                      }), json)];
      }));

var partial_arg$3 = Atdgen_codec_runtime.Encode[/* list */8];

function write__1(param) {
  return partial_arg$3(write_imageHit, param);
}

var partial_arg$4 = Atdgen_codec_runtime.Decode[/* list */11];

function read__1(param) {
  return partial_arg$4(read_imageHit, param);
}

Atdgen_codec_runtime.Decode[/* option_as_constr */25](read__1);

var write_imageOuter = Atdgen_codec_runtime.Encode[/* make */0]((function (t) {
        return Atdgen_codec_runtime.Encode[/* obj */14](/* :: */[
                    Atdgen_codec_runtime.Encode[/* field_o */13](undefined, write__1, "hits", t[/* hits */0]),
                    /* [] */0
                  ]);
      }));

var read_imageOuter = Atdgen_codec_runtime.Decode[/* make */0]((function (json) {
        return /* record */[/* hits */Atdgen_codec_runtime.Decode[/* decode */1](Atdgen_codec_runtime.Decode[/* fieldOptional */17]("hits", read__1), json)];
      }));

var read_streetMain = read__4;

var write_streetMain = write__4;

export {
  read_wikiPage ,
  write_wikiPage ,
  read_wikiQuery ,
  write_wikiQuery ,
  read_wikiMain ,
  write_wikiMain ,
  read_streetAddress ,
  write_streetAddress ,
  read_city ,
  write_city ,
  read_streetMain ,
  write_streetMain ,
  read_imageHit ,
  write_imageHit ,
  read_imageOuter ,
  write_imageOuter ,
  
}
/* write_wikiPage Not a pure module */
