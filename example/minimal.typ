#import "@preview/polylux:0.3.1": *

// definition
#let short_title_state = state("short_title", "")

#let simple-theme(aspect-ratio: "16-9", short-title: "", body) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: 2em,
    header: none,
    footer: none,
  )

  // FIXME: play with these to find out:
  body
  short_title_state.update(short-title)
}

#let title-slide(title: "Title") = {
  let background-color = blue
  let background-img = image("./minimal.jpg")
  set page(background: {
    set image(fit: "stretch", width: 100%, height: 100%)
    background-img
  }, margin: 1em)
  set text(fill: white, font: "Inria Sans", size: 40pt)
  logic.polylux-slide(text(title))
}

// actual document

#show: simple-theme.with(short-title: "Hello world")

#title-slide()
