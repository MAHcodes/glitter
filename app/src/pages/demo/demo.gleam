import components/ui/select.{select}
import lustre/attribute.{class}
import lustre/element.{type Element}
import lustre/element/html.{div, option}

pub fn demo() -> Element(a) {
  div([class("flex flex-col flex-wrap gap-4 justify-center w-full pt-8")], [
    select([select.outlined(select.Neutral), select.md()], [option([], "Neutral")]),
    select([select.outlined(select.Primary), select.md()], [option([], "Primary")]),
    select([select.outlined(select.Secondary), select.md()], [option([], "Secondary")]),
    select([select.outlined(select.Success), select.md()], [option([], "Success")]),
    select([select.outlined(select.Info), select.md()], [option([], "Info")]),
    select([select.outlined(select.Warning), select.md()], [option([], "Warning")]),
    select([select.outlined(select.Danger), select.md()], [option([], "Danger")]),
  ])
}
