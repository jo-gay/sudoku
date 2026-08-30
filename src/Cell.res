@react.component
let make = (~cellstyle, ~value, ~onChange, ~idx) => {
  let style_class = switch cellstyle {
  | "default" => "bg-blue-500 text-white"
  | "unknown" => "bg-gray-500 text-white"
  | "error" => "bg-red-500 text-white"
  | _ => "bg-orange-500 text-white"
  }
  let style_class = style_class ++ " text-center w-8 border border-gray-700 rounded"
  let pos_class = switch (idx % 9, idx / 9) {
    | (2, 2) | (5, 2) | (8, 2) | (2, 5) | (5, 5) | (8, 5) | (2, 8) | (5, 8) | (8, 8) => "border-r-4 border-b-4"
    | (2, _) | (5, _) | (8, _) => "border-r-4"
    | (_, 2) | (_, 5) | (_, 8) => "border-b-4"
    | _ => ""
  }
  <input
    className={style_class ++ " " ++ pos_class}
    type_="text"
    value={value}
    onChange={onChange}
  />
}