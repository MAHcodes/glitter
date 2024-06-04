import gleam/list
import gleam/result
import gleam/string
import gleam/uri.{type Uri}

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
  Slider
  Radio
  Select
}

pub const home = "/"

pub const demo = "/demo/"

pub const blog = "/blog/"

pub const intro = "/docs/guide/introduction/"

pub const installation = "/docs/guide/installation/"

pub const colors = "/docs/guide/colors/"

pub const docs = "/docs/"

pub const components = "/docs/components/"

pub const button = "/docs/components/button/"

pub const input = "/docs/components/input/"

pub const link = "/docs/components/link/"

pub const chip = "/docs/components/chip/"

pub const divider = "/docs/components/divider/"

pub const tooltip = "/docs/components/tooltip/"

pub const avatar = "/docs/components/avatar/"

pub const badge = "/docs/components/badge/"

pub const breadcrumbs = "/docs/components/breadcrumbs/"

pub const switch = "/docs/components/switch/"

pub const kbd = "/docs/components/kbd/"

pub const checkbox = "/docs/components/checkbox/"

pub const spinner = "/docs/components/spinner/"

pub const skeleton = "/docs/components/skeleton/"

pub const slider = "/docs/components/slider/"

pub const radio = "/docs/components/radio/"

pub const select = "/docs/components/select/"

pub type Status {
  None
  New
  Updated
}

pub type Page {
  Page(path: String, sub_pages: List(Page), state: Status)
}

pub fn pages() -> List(Page) {
  [
    Page(
      "Guide",
      [
        Page(intro, [], None),
        Page(installation, [], None),
        Page(colors, [], None),
      ],
      None,
    ),
    Page(
      components,
      [
        Page(button, [], None),
        Page(input, [], None),
        Page(link, [], None),
        Page(chip, [], None),
        Page(divider, [], None),
        Page(tooltip, [], None),
        Page(avatar, [], None),
        Page(badge, [], None),
        Page(breadcrumbs, [], None),
        Page(switch, [], None),
        Page(kbd, [], None),
        Page(checkbox, [], None),
        Page(spinner, [], None),
        Page(skeleton, [], None),
        Page(radio, [], New),
        Page(select, [], New),
      ]
        |> sort_pages,
      None,
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
    Slider -> slider
    Radio -> radio
    Select -> select
  }
}

pub fn to_pages(uri: Uri) -> Pages {
  case uri.path {
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
    p if p == slider -> Slider
    p if p == radio -> Radio
    p if p == select -> Select
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
