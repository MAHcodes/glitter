import components/header/actions.{actions}
import components/header/logo.{logo}
import components/nav.{nav}
import gleam/string
import lustre/attribute.{class}
import lustre/element.{type Element}
import lustre/element/html

pub fn header() -> Element(a) {
  html.header(
    [
      class(
        [
          "sticky top-0 container py-4 bg-background z-30",
          "flex gap-4 items-center justify-between",
        ]
        |> string.join(" "),
      ),
    ],
    [logo(), nav(), actions()],
  )
}
