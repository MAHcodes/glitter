import gleam/list
import gleam/result
import gleam/string
import gleam/uri

pub type Pages {
  Home
  Demo
  Blog
  Intro
  Installation
  Colors
  Components
  Link
  Button
  Input
  Chip
  Divider
  Tooltip
  Avatar
  Badge
  Breadcrumbs
  Switch
  Kbd
  Checkbox
  Spinner
  Skeleton
}

pub const home = "/"

pub const demo = "/demo"

pub const blog = "/blog"

pub const intro = "/docs/guide/introduction"

pub const installation = "/docs/guide/installation"

pub const colors = "/docs/guide/colors"

pub const docs = "/docs"

pub const components = "/docs/components/"

pub const button = "/docs/components/button"

pub const input = "/docs/components/input"

pub const link = "/docs/components/link"

pub const chip = "/docs/components/chip"

pub const divider = "/docs/components/divider"

pub const tooltip = "/docs/components/tooltip"

pub const avatar = "/docs/components/avatar"

pub const badge = "/docs/components/badge"

pub const breadcrumbs = "/docs/components/breadcrumbs"

pub const switch = "/docs/components/switch"

pub const kbd = "/docs/components/kbd"

pub const checkbox = "/docs/components/checkbox"

pub const spinner = "/docs/components/spinner"

pub const skeleton = "/docs/components/skeleton"

pub type Page {
  Page(path: String, sub_pages: List(Page))
}

pub fn pages() -> List(Page) {
  [
    Page("Guide", [Page(intro, []), Page(installation, []), Page(colors, [])]),
    Page(
      components,
      [
        Page(button, []),
        Page(input, []),
        Page(link, []),
        Page(chip, []),
        Page(divider, []),
        Page(tooltip, []),
        Page(avatar, []),
        Page(badge, []),
        Page(breadcrumbs, []),
        Page(switch, []),
        Page(kbd, []),
        Page(checkbox, []),
        Page(spinner, []),
        Page(skeleton, []),
      ]
        |> sort_pages,
    ),
  ]
}

pub fn to_path(page: Pages) -> String {
  case page {
    Home -> intro
    Demo -> demo
    Colors -> colors
    Intro -> intro
    Blog -> blog
    Button -> button
    Input -> input
    Link -> link
    Chip -> chip
    Divider -> divider
    Tooltip -> tooltip
    Avatar -> avatar
    Components -> avatar
    Installation -> installation
    Badge -> badge
    Breadcrumbs -> breadcrumbs
    Switch -> switch
    Kbd -> kbd
    Checkbox -> checkbox
    Spinner -> spinner
    Skeleton -> skeleton
  }
}

pub fn to_pages(path: String) -> Pages {
  case path {
    p if p == demo -> Demo
    p if p == colors -> Colors
    p if p == intro -> Intro
    p if p == blog -> Blog
    p if p == button -> Button
    p if p == input -> Input
    p if p == link -> Link
    p if p == chip -> Chip
    p if p == divider -> Divider
    p if p == tooltip -> Tooltip
    p if p == avatar -> Avatar
    p if p == avatar -> Components
    p if p == installation -> Installation
    p if p == badge -> Badge
    p if p == breadcrumbs -> Breadcrumbs
    p if p == switch -> Switch
    p if p == kbd -> Kbd
    p if p == checkbox -> Checkbox
    p if p == spinner -> Spinner
    p if p == skeleton -> Skeleton
    _ -> Home
  }
}

pub fn is_active(page: Pages, path: String) -> Bool {
  to_path(page) == path
}

// used to sort the pages
fn compare_pages(p1: Page, p2: Page) {
  string.compare(page_name(p1), page_name(p2))
}

fn sort_pages(pages: List(Page)) -> List(Page) {
  pages
  |> list.sort(compare_pages)
}

pub fn page_name(page: Page) -> String {
  page.path
  |> path_name
}

pub fn path_name(path: String) -> String {
  path
  |> uri.path_segments()
  |> list.last
  |> result.unwrap("")
  |> string.capitalise
}
