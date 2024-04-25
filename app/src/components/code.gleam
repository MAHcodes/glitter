import components/ui/button.{button}
import gleam/string
import lustre/attribute.{class}
import lustre/element.{type Element}
import lustre/element/html.{div, pre, text}
import lustre/ui/icon

pub fn code(c: String) -> Element(a) {
  div([class("relative group")], [
    pre(
      [
        class(
          [
            "language-gleam hljs",
            "rounded-b-md border-b-2 border-x-2 border-foreground/10 p-4",
          ]
          |> string.join(" "),
        ),
      ],
      [html.code([], [text(c)])],
    ),
    button(
      [
        class("copy absolute top-4 right-4 invisible group-hover:visible"),
        button.icon(),
        button.flat(button.Neutral),
      ],
      [icon.copy([class("w-5")])],
    ),
    button(
      [
        class("copy-success absolute top-4 right-4 invisible"),
        button.icon(),
        button.flat(button.Success),
      ],
      [icon.check([class("w-5")])],
    ),
    button(
      [
        class("copy-danger absolute top-4 right-4 invisible"),
        button.icon(),
        button.flat(button.Danger),
      ],
      [icon.cross([class("w-5")])],
    ),
  ])
}
