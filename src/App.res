@react.component
let make = () => {
  let values_initial = [0, 0, 0, 0, 0, 0, 8, 0, 9,
                        0, 0, 5, 0, 0, 7, 0, 2, 3,
                        0, 0, 0, 0, 5, 0, 1, 6, 0,
                        0, 0, 0, 0, 0, 2, 7, 0, 0,
                        5, 2, 0, 3, 0, 0, 0, 8, 1,
                        0, 0, 7, 0, 9, 0, 0, 0, 0,
                        9, 0, 0, 1, 0, 3, 0, 0, 8,
                        0, 3, 0, 0, 0, 8, 0, 0, 0,
                        0, 0, 6, 0, 0, 0, 0, 0, 0,
  ]
  let (values_raw, set_values_raw) = React.useState(_ => values_initial)
  let updateRawValue = (idx, newValue) => {
    set_values_raw(oldValues => {
      let newValues = Belt.Array.copy(oldValues)
      newValues[idx] = newValue->Int.fromString->Belt.Option.getWithDefault(0)
      newValues
    })
  }
  let (values_disp, set_values_disp) = React.useState(_=>React.array([]))
  React.useEffect(() => {
    set_values_disp(_=> {
      React.array(values_raw->Array.mapWithIndex(
        (item, idx) => {
          let cellstyle = switch (item) {
              | 1 => "default"
              | 0 => "unknown"
              | -1 => "error"
              | _ => "default"
          }
          <Cell key={idx->Int.toString} 
            value={item==0 ? "" : item->Int.toString}
            cellstyle={cellstyle}
            idx={idx}
            onChange={event => {
              let newVal = ReactEvent.Form.currentTarget(event)["value"]
              updateRawValue(idx, newVal)
            }}
          />
        }
      )
    )
  })
  None
  }, [values_raw])


  <div className="max-w-1200">
    <div className="grid content-start gap-1 grid-cols-9">
      {values_disp}
    </div>
    <div className="my-4 flex gap-2 justify-between">
      <Button onClick={_ => {
        let solution = values_raw->Solver.solve
        Console.log("solution: " ++ Array.join(Array.map(solution, val => val->Int.toString), ", "))
        set_values_raw(_oldValues=>{
          Belt.Array.copy(solution)
        })
      }}>
        {React.string(`Solve`)}
      </Button>
      <Button onClick={_ => {
        set_values_raw(_oldValues=>{
          Belt.Array.copy(values_initial)
        })
      }}>
        {React.string(`Reset`)}
      </Button>
      <Button onClick={_ => {
        set_values_raw(_oldValues=>{
          Belt.Array.copy(
            [0, 0, 0, 0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0, 0, 0, 0, 0,
             ])
        })
      }}>
        {React.string(`Clear`)}
      </Button>
    </div>
  </div>
}
