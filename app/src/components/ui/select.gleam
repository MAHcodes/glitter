import gleam/string
import lustre/attribute.{type Attribute, class}
import lustre/element.{type Element}
import lustre/element/html.{div, label}

pub type Colors {
  Neutral
  Primary
  Secondary
  Success
  Info
  Warning
  Danger
}

pub fn select(
  attributes: List(Attribute(a)),
  children: List(Element(a)),
) -> Element(a) {
  label([class("relative")], [
    html.select(
      [
        class(
          "appearance-none enabled:cursor-pointer disabled:opacity-50 [&:disabled+div]:opacity-50 disabled:cursor-not-allowed w-full",
        ),
        ..attributes
      ],
      children,
    ),
    div(
      [
        class(
          [
            "pointer-events-none",
            "before:absolute before:size-1 before:right-4 before:pointer-events-none",
            "before:border-4 before:border-x-transparent before:border-t-0 before:border-b-current before:top-1/2 before:-translate-y-[133.333333%]",
            "after:absolute after:size-1 after:right-4 after:pointer-events-none",
            "after:border-4 after:border-x-transparent after:border-b-0 after:border-t-current after:top-1/2 after:translate-y-1/3",
          ]
          |> string.join(" "),
        ),
      ],
      [],
    ),
  ])
}

pub fn flat(color: Colors) -> Attribute(a) {
  case color {
    Neutral ->
      "text-neutral bg-neutral/20 hover:enabled:bg-neutral/30 [&+div]:text-neutral"
    Primary ->
      "text-primary bg-primary/20 hover:enabled:bg-primary/30 [&+div]:text-primary"
    Secondary ->
      "text-secondary bg-secondary/20 hover:enabled:bg-secondary/30 [&+div]:text-secondary"
    Success ->
      "text-success bg-success/20 hover:enabled:bg-success/30 [&+div]:text-success"
    Info -> "text-info bg-info/20 hover:enabled:bg-info/30 [&+div]:text-info"
    Warning ->
      "text-warning bg-warning/20 hover:enabled:bg-warning/30 [&+div]:text-warning"
    Danger ->
      "text-danger bg-danger/20 hover:enabled:bg-danger/30 [&+div]:text-danger"
  }
  |> string.append(
    " focus:outline-none focus:ring-2 focus:ring-current open:outline-none open:ring-2 open:ring-current",
  )
  |> class
}

pub fn outlined(color: Colors) -> Attribute(a) {
  case color {
    Neutral ->
      "border-neutral focus:enabled:border-neutral open:enabled:border-neutral hover:enabled:border-neutral text-neutral [&+div]:text-neutral"
    Primary ->
      "border-primary focus:enabled:border-primary open:enabled:border-primary hover:enabled:border-primary text-primary [&+div]:text-primary"
    Secondary ->
      "border-secondary focus:enabled:border-secondary open:enabled:border-secondary hover:enabled:border-secondary text-secondary [&+div]:text-secondary"
    Success ->
      "border-success focus:enabled:border-success open:enabled:border-success hover:enabled:border-success text-success [&+div]:text-success"
    Info ->
      "border-info focus:enabled:border-info open:enabled:border-info hover:enabled:border-info text-info [&+div]:text-info"
    Warning ->
      "border-warning focus:enabled:border-warning open:enabled:border-warning hover:enabled:border-warning text-warning [&+div]:text-warning"
    Danger ->
      "border-danger focus:enabled:border-danger open:enabled:border-danger hover:enabled:border-danger text-danger [&+div]:text-danger"
  }
  |> string.append(
    [
      " bg-transparent border-2 border-opacity-50 placeholder-opacity-70",
      "hover:enabled:border-opacity-100 focus:enabled:border-opacity-100 open:enabled:border-opacity-100",
      "focus:outline-none focus:ring-2 focus:ring-current",
      "open:outline-none open:ring-2 open:ring-current",
    ]
    |> string.join(" "),
  )
  |> class
}

pub fn underlined(color: Colors) -> Attribute(a) {
  case color {
    Neutral -> "border-neutral text-neutral [&+div]:text-neutral"
    Primary -> "border-primary text-primary [&+div]:text-primary"
    Secondary -> "border-secondary text-secondary [&+div]:text-secondary"
    Success -> "border-success text-success [&+div]:text-success"
    Info -> "border-info text-info [&+div]:text-info"
    Warning -> "border-warning text-warning [&+div]:text-warning"
    Danger -> "border-danger text-danger [&+div]:text-danger"
  }
  |> string.append(
    [
      " bg-transparent border-opacity-20 border-b-2 outline-none rounded-b-none",
      "focus:enabled:border-opacity-100 open:enabled:border-opacity-100",
    ]
    |> string.join(" "),
  )
  |> class
}

pub fn sm() -> Attribute(a) {
  class("rounded-sm pl-3.5 pr-9 py-1.5 text-sm")
}

pub fn md() -> Attribute(a) {
  class("rounded-md pl-4 pr-10 py-2 text-base")
}

pub fn lg() -> Attribute(a) {
  class("rounded-lg pl-5 pr-12 py-2.5 text-lg")
}
