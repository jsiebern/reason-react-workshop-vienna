[@bs.val] external decodeURIComponent: string => string = "";

type state = {cities: Data_t.cityArray};

type action =
  | Add(Data_t.city)
  | Remove(Data_t.city);

[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  let selected =
    decodeURIComponent(
      url.path->Belt.List.get(0)->Belt.Option.getWithDefault("Vienna"),
    );

  let (state, dispatch) =
    React.useReducer(
      (state, action) => {
        let redirect = ref(false);
        let result =
          switch (action) {
          | Add(city) => {
              cities:
                Some(
                  state.cities
                  ->Belt.Option.getWithDefault([||])
                  ->Belt.Array.concat([|city|]),
                ),
            }
          | Remove(city) =>
            redirect := city.name === selected;
            {
              cities:
                Some(
                  state.cities
                  ->Belt.Option.getWithDefault([||])
                  ->Belt.Array.keep(c => c.name !== city.name),
                ),
            };
          };
        let result = {
          cities:
            result.cities
            ->Belt.Option.map(cities =>
                cities->Belt.SortArray.stableSortBy((c1, c2) =>
                  compare(c1.name, c2.name)
                )
              ),
        };
        Dom.Storage.localStorage
        |> Dom.Storage.setItem(
             "result",
             result.cities->Data_bs.write_cityArray->Js.Json.stringify,
           );
        Js.Global.setTimeout(
          () =>
            if (redirect^) {
              ReasonReactRouter.push("/");
            },
          1,
        )
        ->ignore;
        result;
      },
      try (
        Dom.Storage.getItem("result", Dom.Storage.localStorage)
        ->Belt.Option.map(item =>
            {cities: Js.Json.parseExn(item)->Data_bs.read_cityArray}
          )
        ->Belt.Option.getWithDefault({cities: None})
      ) {
      | _ => {cities: None}
      },
    );

  let cityCallback = (c: Data_t.city) => {
    dispatch(Add(c));
  };

  let hasCity =
    state.cities
    ->Belt.Option.getWithDefault([||])
    ->Belt.Array.keep(c => c.name === selected)
    ->Belt.Array.length
    > 0;

  React.useEffect1(
    () => {
      if (!hasCity && selected !== "") {
        Sync.fetchCity(selected, maybeCity =>
          switch (maybeCity) {
          | Some(city) => dispatch(Add(city))
          | None => ()
          }
        );
      };
      None;
    },
    [|None|],
  );

  <Layout
    cityCallback
    menu={
      <CityList
        removeCity={city => dispatch(Remove(city))}
        selected
        cities={state.cities}
      />
    }>
    <CityMap selected cities={state.cities} />
  </Layout>;
};