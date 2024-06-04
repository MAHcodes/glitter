import components/ui/select.{select}
import lustre/element.{type Element}
import lustre/element/html.{option}
import pages/docs/sections/section

pub fn attributes() -> Element(a) {
  section.attributes([
    section.attribute(
      "Size",
      "
- `sm()`: Small Size
- `md()`: Medium Size
- `lg()`: Large Size
    ",
      [
        select([select.outlined(select.Neutral), select.sm()], [
          option([], "Small"),
        ]),
        select([select.outlined(select.Neutral), select.md()], [
          option([], "Medium"),
        ]),
        select([select.outlined(select.Neutral), select.lg()], [
          option([], "Large"),
        ]),
      ],
      size_code(),
    ),
  ])
}

fn size_code() -> String {
  "
import components/ui/select.{select}
import lustre/attribute.{class}
import lustre/element.{type Element}
import lustre/element/html.{div, option}

pub fn demo() -> Element(a) {
  div([class(\"flex flex-col flex-wrap gap-4 justify-center w-full\")], [
    select([select.outlined(select.Neutral), select.sm()], [option([], \"Small\")]),
    select([select.outlined(select.Neutral), select.md()], [option([], \"Medium\")]),
    select([select.outlined(select.Neutral), select.lg()], [option([], \"Large\")]),
  ])
}
"
}
