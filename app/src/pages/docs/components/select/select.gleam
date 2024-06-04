import components/prose.{prose}
import lustre/element.{type Element}
import pages/docs/components/select/attributes.{attributes}
import pages/docs/components/select/variants.{variants}
import pages/docs/sections/section

pub fn docs() -> Element(a) {
  prose([], [
    section.intro(
      "Select",
      "Select components are used for collecting user provided information from a list of options.",
    ),
    section.installation("gleam run -m gleez add select"),
    variants(),
    attributes(),
  ])
}
