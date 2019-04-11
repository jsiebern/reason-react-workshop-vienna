[@react.component]
let make =
    (
      ~cities: option(array(Data.city)),
      ~selected: string,
      ~removeCity: Data.city => unit,
    ) =>
  switch (cities) {
  | Some(c) =>
    MaterialUi.(
      <List>
        {c
         ->Belt.Array.map(city =>
             <ListItem
               selected={city.name === selected}
               key={city.id}
               button=true
               onClick={_ => ReasonReactRouter.push(city.name)}>
               <ListItemAvatar>
                 <Avatar
                   src={city.image.url->Belt.Option.getWithDefault("")}
                 />
               </ListItemAvatar>
               <ListItemText
                 primary={city.name->React.string}
                 secondary={city.country->React.string}
               />
               <ListItemSecondaryAction>
                 <Button
                   onClick={_ => removeCity(city)}
                   variant=`Outlined
                   color=`Secondary>
                   "X"
                 </Button>
               </ListItemSecondaryAction>
             </ListItem>
           )
         ->React.array}
      </List>
    )
  | None => "You have not visited any cities yet. :-(" |> React.string
  };