module Map = {
  [@react.component] [@bs.module "react-leaflet"]
  external make:
    (~center: (float, float)=?, ~zoom: int, ~children: React.element=?) =>
    React.element =
    "Map";
};

module Marker = {
  [@react.component] [@bs.module "react-leaflet"]
  external make:
    (~position: (float, float), ~children: React.element=?) => React.element =
    "Marker";
};

module Popup = {
  [@react.component] [@bs.module "react-leaflet"]
  external make: (~children: React.element) => React.element = "Popup";
};

module TileLayer = {
  [@react.component] [@bs.module "react-leaflet"]
  external make: (~url: string, ~attribution: string) => React.element =
    "TileLayer";
};