open ReactLeaflet;

module Style = {
  open Emotion;

  let popup = css([]);
};

[@genType]
[@react.component]
let make = (~cities: option(array(Data_t.city)), ~selected: string) => {
  let selected =
    cities->Belt.Option.flatMap(city =>
      city->Belt.Array.keep(c => c.name === selected)->Belt.Array.get(0)
    );

  switch (selected, cities) {
  | (Some(city), Some(cities)) =>
    MaterialUi.(
      <Grid container=true className=Emotion.(css([height(100.->pct)]))>
        <Grid item=true md=V8>
          <Map center=(city.coordinates.lat, city.coordinates.lng) zoom=13>
            <TileLayer
              attribution={|&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors|}
              url={|http://{s}.tile.osm.org/{z}/{x}/{y}.png|}
            />
            {cities
             ->Belt.Array.map(city =>
                 <Marker
                   position=(city.coordinates.lat, city.coordinates.lng)
                   key={city.id}>
                   <Popup>
                     <GridList
                       cellHeight={`Int(180)}
                       cols={`Int(1)}
                       spacing={`Int(0)}>
                       <GridListTile
                         classes=[
                           ImgFullWidth(Emotion.(css([width(100.->pct)]))),
                         ]>
                         <img
                           src={
                             city.image.url->Belt.Option.getWithDefault("")
                           }
                           alt={city.image.attribution}
                         />
                         <GridListTileBar
                           title={city.name->React.string}
                           subtitle={
                             <span>
                               city.image.attribution->React.string
                             </span>
                           }
                         />
                       </GridListTile>
                     </GridList>
                   </Popup>
                 </Marker>
               )
             ->React.array}
          </Map>
        </Grid>
        <Grid item=true md=V4>
          <GridList cellHeight={`Int(180)} cols={`Int(1)} spacing={`Int(0)}>
            <GridListTile
              classes=[ImgFullWidth(Emotion.(css([width(100.->pct)])))]>
              <img
                src={city.image.url->Belt.Option.getWithDefault("")}
                alt={city.image.attribution}
              />
              <GridListTileBar
                title={city.name->React.string}
                subtitle={<span> city.country->React.string </span>}
              />
            </GridListTile>
          </GridList>
          <br />
          <CitySummary key={city.name} cityName={city.name} />
        </Grid>
      </Grid>
    )
  | _ => React.null
  };
};