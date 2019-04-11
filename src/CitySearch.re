[@react.component]
let make = (~addCity: Data.city => unit) => {
  let (text, setText) = React.useReducer((_, t: string) => t, "");

  let goFetch = () => {
    let oText = text;
    setText("");
    Sync.fetchCity(text, maybeCity =>
      switch (maybeCity) {
      | Some(city) => addCity(city)
      | None => setText(oText)
      }
    );
  };

  MaterialUi.(
    <Grid container=true spacing=V8>
      <Grid item=true md=V8>
        <TextField
          placeholder="Enter City"
          value={`String(text)}
          onChange={event => setText(event->ReactEvent.Form.target##value)}
          fullWidth=true
          inputProps={
            "onKeyPress": event =>
              switch (event##charCode) {
              | 13 => goFetch()
              | _ => ()
              },
          }
        />
      </Grid>
      <Grid item=true md=V2>
        <Button
          fullWidth=true
          variant=`Outlined
          color=`Default
          onClick={_ => goFetch()}>
          "Add"
        </Button>
      </Grid>
    </Grid>
  );
};