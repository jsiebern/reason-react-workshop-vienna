[@react.component]
let make = (~cityName: string) => {
  let (content, setContent) =
    React.useReducer((_, c: string) => c, "Loading...");

  React.useEffect(() => {
    Js.Promise.(
      Fetch.fetchWithInit(
        "https://cors-anywhere.herokuapp.com/https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&titles="
        ++ cityName,
        Fetch.RequestInit.make(~mode=CORS, ()),
      )
      |> then_(Fetch.Response.json)
      |> then_(json => {
           let obj = json->Obj.magic;
           let obj = obj##query##pages->Obj.magic;
           let keys = obj->Js.Dict.keys;
           let key = keys->Belt.Array.getExn(0);
           let page = obj->Js.Dict.unsafeGet(key)->Obj.magic;
           setContent(page##extract);
           resolve();
         })
    )
    ->ignore;
    None;
  });

  <MaterialUi_Typography
    variant=`Caption
    className=Emotion.(
      css([
        maxHeight(`calc((`sub, 100.->pct, 264->px))),
        padding(10->px),
        overflowY(`scroll),
      ])
    )>
    content->React.string
  </MaterialUi_Typography>;
};