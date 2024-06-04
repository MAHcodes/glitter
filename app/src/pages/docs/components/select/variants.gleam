import components/ui/select.{select}
import lustre/element.{type Element}
import lustre/element/html.{option}
import pages/docs/sections/section

pub fn variants() -> Element(a) {
  section.variants([
    section.variant(
      "Outlined",
      "",
      [
        select([select.outlined(select.Neutral), select.md()], [
          option([], "Neutral"),
        ]),
        select([select.outlined(select.Primary), select.md()], [
          option([], "Primary"),
        ]),
        select([select.outlined(select.Secondary), select.md()], [
          option([], "Secondary"),
        ]),
        select([select.outlined(select.Success), select.md()], [
          option([], "Success"),
        ]),
        select([select.outlined(select.Info), select.md()], [option([], "Info")]),
        select([select.outlined(select.Warning), select.md()], [
          option([], "Warning"),
        ]),
        select([select.outlined(select.Danger), select.md()], [
          option([], "Danger"),
        ]),
      ],
      outlined_code(),
    ),
    section.variant(
      "Underlined",
      "",
      [
        select([select.underlined(select.Neutral), select.md()], [
          option([], "Neutral"),
        ]),
        select([select.underlined(select.Primary), select.md()], [
          option([], "Primary"),
        ]),
        select([select.underlined(select.Secondary), select.md()], [
          option([], "Secondary"),
        ]),
        select([select.underlined(select.Success), select.md()], [
          option([], "Success"),
        ]),
        select([select.underlined(select.Info), select.md()], [
          option([], "Info"),
        ]),
        select([select.underlined(select.Warning), select.md()], [
          option([], "Warning"),
        ]),
        select([select.underlined(select.Danger), select.md()], [
          option([], "Danger"),
        ]),
      ],
      underlined_code(),
    ),
    section.variant(
      "Flat",
      "",
      [
        select([select.flat(select.Neutral), select.md()], [
          option([], "Neutral"),
        ]),
        select([select.flat(select.Primary), select.md()], [
          option([], "Primary"),
        ]),
        select([select.flat(select.Secondary), select.md()], [
          option([], "Secondary"),
        ]),
        select([select.flat(select.Success), select.md()], [
          option([], "Success"),
        ]),
        select([select.flat(select.Info), select.md()], [option([], "Info")]),
        select([select.flat(select.Warning), select.md()], [
          option([], "Warning"),
        ]),
        select([select.flat(select.Danger), select.md()], [option([], "Danger")]),
      ],
      flat_code(),
    ),
  ])
}

fn outlined_code() -> String {
  "
import components/ui/select.{select}
import lustre/attribute.{class}
import lustre/element.{type Element}
import lustre/element/html.{div, option}

pub fn demo() -> Element(a) {
  div([class(\"flex flex-col flex-wrap gap-4 justify-center w-full\")], [
    select([select.outlined(select.Neutral), select.md()], [option([], \"Neutral\")]),
    select([select.outlined(select.Primary), select.md()], [option([], \"Primary\")]),
    select([select.outlined(select.Secondary), select.md()], [option([], \"Secondary\")]),
    select([select.outlined(select.Success), select.md()], [option([], \"Success\")]),
    select([select.outlined(select.Info), select.md()], [option([], \"Info\")]),
    select([select.outlined(select.Warning), select.md()], [option([], \"Warning\")]),
    select([select.outlined(select.Danger), select.md()], [option([], \"Danger\")]),
  ])
}
"
}

fn underlined_code() -> String {
  "
import components/ui/select.{select}
import lustre/attribute.{class}
import lustre/element.{type Element}
import lustre/element/html.{div, option}

pub fn demo() -> Element(a) {
  div([class(\"flex flex-col flex-wrap gap-4 justify-center w-full\")], [
    select([select.underlined(select.Neutral), select.md()], [option([], \"Neutral\")]),
    select([select.underlined(select.Primary), select.md()], [option([], \"Primary\")]),
    select([select.underlined(select.Secondary), select.md()], [option([], \"Secondary\")]),
    select([select.underlined(select.Success), select.md()], [option([], \"Success\")]),
    select([select.underlined(select.Info), select.md()], [option([], \"Info\")]),
    select([select.underlined(select.Warning), select.md()], [option([], \"Warning\")]),
    select([select.underlined(select.Danger), select.md()], [option([], \"Danger\")]),
  ])
}
"
}

fn flat_code() -> String {
  "
import components/ui/select.{select}
import lustre/attribute.{class}
import lustre/element.{type Element}
import lustre/element/html.{div, option}

pub fn demo() -> Element(a) {
  div([class(\"flex flex-col flex-wrap gap-4 justify-center w-full\")], [
    select([select.flat(select.Neutral), select.md()], [option([], \"Neutral\")]),
    select([select.flat(select.Primary), select.md()], [option([], \"Primary\")]),
    select([select.flat(select.Secondary), select.md()], [option([], \"Secondary\")]),
    select([select.flat(select.Success), select.md()], [option([], \"Success\")]),
    select([select.flat(select.Info), select.md()], [option([], \"Info\")]),
    select([select.flat(select.Warning), select.md()], [option([], \"Warning\")]),
    select([select.flat(select.Danger), select.md()], [option([], \"Danger\")]),
  ])
}
"
}
