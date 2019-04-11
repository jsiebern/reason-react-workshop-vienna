[@genType]
type image = {
  url: option(string),
  attribution: string,
  attributionUrl: option(string),
};

[@genType]
type coordinates = {
  lat: float,
  lng: float,
};

[@genType]
type city = {
  id: string,
  name: string,
  country: string,
  coordinates,
  image,
};
