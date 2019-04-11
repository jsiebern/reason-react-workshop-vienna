module Style = {
  open Emotion;

  let toolbar = css([]);

  let drawer = css([position(`relative)->important]);
  let container = css([height(`calc((`sub, 100.->pct, 64->px)))]);
};

[@react.component]
let make = (~children: React.element, ~menu: React.element, ~cityCallback) =>
  MaterialUi.(
    <div>
      <AppBar position=`Static>
        <Toolbar>
          <Grid container=true>
            <Grid item=true md=V9>
              <Typography
                className=Emotion.(css([color(`hex("fff"))->important]))
                variant=`H6>
                "Map-O-Pedia"->React.string
              </Typography>
            </Grid>
            <Grid item=true md=V3> <CitySearch addCity=cityCallback /> </Grid>
          </Grid>
        </Toolbar>
      </AppBar>
      <Grid container=true className=Style.container>
        <Grid item=true md=V3>
          <Drawer
            className=Style.drawer
            classes=[PaperAnchorLeft(Style.drawer)]
            variant=`Persistent
            anchor=`Left
            open_=true>
            menu
          </Drawer>
        </Grid>
        <Grid item=true md=V9> children </Grid>
      </Grid>
    </div>
  );