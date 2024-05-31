import components/ui/link.{a}
import gleam/string
import lustre/attribute.{type Attribute, class, href, target}
import lustre/element.{type Element, fragment, text}
import lustre/element/html.{li, ul}
import lustre/ui/icon
import model/route.{type Pages, is_active}

fn active_variant(active: Bool) -> Attribute(a) {
  case active {
    True -> link.link(link.Primary)
    False -> link.link(link.Neutral)
  }
}

pub fn nav(route: Pages) -> Element(a) {
  html.nav([], [
    ul([class("flex gap-8 pl-8 text-sm")], [
      item(route, route.docs),
      item(route, route.components),
      item(route, "https://github.com/MAHcodes/gleez/releases"),
      // item(route, route.blog),
      // item(route, route.demo),
    ]),
  ])
}

fn is_internal(path: String) -> Bool {
  path
  |> string.starts_with("/")
}

fn tgt(path: String) -> Attribute(a) {
  case is_internal(path) {
    True -> target("_self")
    False -> target("_blank")
  }
}

fn icon(path: String) -> Element(a) {
  case is_internal(path) {
    True -> fragment([])
    False -> icon.external_link([class("w-4")])
  }
}

fn item(route: Pages, path: String) -> Element(a) {
  li([], [
    a(
      [
        href(path),
        link.underline(link.Hover),
        active_variant(is_active(route, path)),
        tgt(path),
      ],
      [html.span([], [text(route.path_name(path))]), icon(path)],
    ),
  ])
}
