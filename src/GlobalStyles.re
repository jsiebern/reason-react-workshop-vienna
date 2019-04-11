open Emotion;

global(
  "html, body, #root, #root > div",
  [margin(0->px), padding(0->px), width(100.->pct), height(100.->pct)],
);
global("*", [boxSizing(`borderBox), fontFamily("Roboto")]);

global(".leaflet-container", [height(100.->pct), width(100.->pct)]);

global(".leaflet-popup-content-wrapper", [borderRadius(0->px)]);