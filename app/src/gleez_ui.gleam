import components/aside.{aside}
import components/barbecue.{barbecue}
import components/header/header.{header}
import gleam/dynamic
import gleam/option.{type Option, None, Some}
import gleam/uri.{type Uri}
import lustre
import lustre/attribute.{class}
import lustre/effect.{type Effect, batch}
import lustre/element.{type Element}
import lustre/element/html.{div}
import lustre_http.{type HttpError}
import model/repo.{type Repo, Repo}
import model/route.{type Pages, to_pages}
import modem
import pages/page

pub fn main() {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)
}

fn init(_) -> #(Model, Effect(Msg)) {
  #(
    Model(page: to_pages(uri()), repo: None),
    batch([fetch_stargazers_count(), modem.init(on_url_change), on_load()]),
  )
}

fn on_url_change(uri: Uri) -> Msg {
  case uri.path_segments(uri.path) {
    ["demo"] -> OnRouteChange(route.Demo)
    ["blog"] -> OnRouteChange(route.Blog)
    ["docs", "guide", "introduction"] -> OnRouteChange(route.Intro)
    ["docs", "guide", "installation"] -> OnRouteChange(route.Installation)
    ["docs", "guide", "colors"] -> OnRouteChange(route.Colors)
    ["docs", "components"] -> OnRouteChange(route.Components)
    ["docs", "components", "button"] -> OnRouteChange(route.Button)
    ["docs", "components", "input"] -> OnRouteChange(route.Input)
    ["docs", "components", "link"] -> OnRouteChange(route.Link)
    ["docs", "components", "chip"] -> OnRouteChange(route.Chip)
    ["docs", "components", "divider"] -> OnRouteChange(route.Divider)
    ["docs", "components", "tooltip"] -> OnRouteChange(route.Tooltip)
    ["docs", "components", "avatar"] -> OnRouteChange(route.Avatar)
    ["docs", "components", "badge"] -> OnRouteChange(route.Badge)
    ["docs", "components", "breadcrumbs"] -> OnRouteChange(route.Breadcrumbs)
    ["docs", "components", "switch"] -> OnRouteChange(route.Switch)
    ["docs", "components", "kbd"] -> OnRouteChange(route.Kbd)
    ["docs", "components", "checkbox"] -> OnRouteChange(route.Checkbox)
    ["docs", "components", "spinner"] -> OnRouteChange(route.Spinner)
    ["docs", "components", "skeleton"] -> OnRouteChange(route.Skeleton)
    ["docs", "components", "slider"] -> OnRouteChange(route.Slider)
    ["docs", "components", "radio"] -> OnRouteChange(route.Radio)
    ["docs", "components", "select"] -> OnRouteChange(route.Select)
    _ -> OnRouteChange(route.Home)
  }
}

pub opaque type Msg {
  OnRouteChange(Pages)
  ApiUpdatedRepo(Result(Repo, HttpError))
}

@external(javascript, "./assets/js/highlight/gleam.ffi.mjs", "highlight_all")
fn do_highlight_all() -> Nil

@external(javascript, "./assets/js/ffi.mjs", "attach_all")
fn do_attach_all() -> Nil

@external(javascript, "./assets/js/ffi.mjs", "uri")
fn uri() -> uri.Uri

fn attach_all() -> Effect(a) {
  effect.from(fn(_) { do_attach_all() })
}

fn highlight_all() -> Effect(a) {
  effect.from(fn(_) { do_highlight_all() })
}

fn on_load() -> Effect(a) {
  effect.batch([highlight_all(), attach_all()])
}

type Model {
  Model(page: Pages, repo: Option(Repo))
}

fn fetch_stargazers_count() -> Effect(Msg) {
  let url = "https://api.github.com/repos/MAHcodes/gleez"

  let decoder =
    dynamic.decode1(Repo, dynamic.field("stargazers_count", dynamic.int))

  lustre_http.get(url, lustre_http.expect_json(decoder, ApiUpdatedRepo))
}

fn update(model: Model, msg: Msg) -> #(Model, Effect(Msg)) {
  case msg {
    OnRouteChange(r) -> #(Model(..model, page: r), on_load())
    ApiUpdatedRepo(Error(_)) -> #(model, effect.none())
    ApiUpdatedRepo(Ok(repo)) -> #(
      Model(..model, repo: Some(repo)),
      effect.none(),
    )
  }
}

fn view(model: Model) -> Element(Msg) {
  html.main([], [
    header(model.page),
    div([class("container")], [
      case model.page {
        // route.Home -> page.home()
        route.Demo -> page.demo()
        route.Blog -> page.blog()
        _ -> with_aside(model)
      },
    ]),
  ])
}

fn with_aside(model: Model) -> Element(Msg) {
  div([class("flex gap-10")], [
    aside(model.page),
    div([class("py-4 flex-1")], [
      barbecue(model.page),
      case model.page {
        route.Home -> page.intro(model.repo)
        route.Intro -> page.intro(model.repo)
        route.Installation -> page.installation()
        route.Colors -> page.colors()
        route.Components -> page.avatar()
        route.Button -> page.button()
        route.Input -> page.input()
        route.Link -> page.link()
        route.Chip -> page.chip()
        route.Divider -> page.divider()
        route.Tooltip -> page.tooltip()
        route.Avatar -> page.avatar()
        route.Badge -> page.badge()
        route.Breadcrumbs -> page.breadcrumbs()
        route.Switch -> page.switch()
        route.Kbd -> page.kbd()
        route.Checkbox -> page.checkbox()
        route.Spinner -> page.spinner()
        route.Skeleton -> page.skeleton()
        route.Slider -> page.slider()
        route.Radio -> page.radio()
        route.Select -> page.select()
        _ -> page.home()
      },
    ]),
  ])
}
