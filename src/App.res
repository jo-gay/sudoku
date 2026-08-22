@react.component
let make = () => {
  let values_raw = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
  let values = React.array(
    values_raw->Array.map(item => <Button className="m-1">{React.string(item->Int.toString)}</Button>)
  )
  // let (count, setCount) = React.useState(() => 0)


  <div className="max-w-1200">
    <div className="grid content-start gap-1 grid-cols-5">
      {values}
    </div>
    <div className="my-4">
      <Button onClick={_ => Console.log("Solve button clicked")}>
        {React.string(`Solve`)}
      </Button>
    </div>
  </div>
}
