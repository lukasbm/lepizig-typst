#import "colors.typ": *
#import "util.typ": *
#import "fonts.typ": *
#import "styles.typ": *
#import "slides.typ": *
#import "components.typ": *

#let setup-theme(
  aspect-ratio: "16-9",
  short-title: none,
  short-author: none,
  short-date: none,
  short-organization: none,
  body,
) = {
  // global style setup
  set page(paper: "presentation-" + aspect-ratio)
  set text(font: FontFamily, size: TextFontSize)
  // set block(spacing: 1em)

  // essentially disable level 1 headings
  show heading.where(level: 1): it => {} // or just ": none"

  // state updates
  state-short-title.update(short-title)
  state-short-author.update(short-author)
  state-short-date.update(short-date)
  state-short-organization.update(short-organization)

  // include document
  body
}
