#import "@preview/polylux:0.3.1": logic
#import "@preview/polylux:0.3.1": utils

#let fau-theme(aspect-ratio: "16-9", darkness: "dark", body) = {
  let background-color = if darkness == "dark" {
    navy
  } else if darkness == "very dark" {
    navy.darken(50%)
  } else if darkness == "ultra dark" {
    black
  } else {
    panic("illegal darkness, must be one of dark, very dark, ultra dark")
  }

  set page(paper: "presentation-" + aspect-ratio, fill: background-color)
  set text(fill: white.darken(10%), size: 40pt, font: "Fira Sans")

  body
}

#let title-slide(title: [], author: []) = {
  logic.polylux-slide({
    set align(center + horizon)
    smallcaps(strong(title))
    parbreak()
    text(size: .7em, author)
  })
}

#let slide(title: [], body) = {
  logic.polylux-slide({
    strong(title)
    set align(horizon)
    body
  })
}

#let focus-slide(background-color: none, background-img: none, body) = {
  let background-color = if background-img == none and background-color ==  none {
    rgb("#0C6291")
  } else {
    background-color
  }

  set page(fill: background-color, margin: 1em) if background-color != none
  set page(
    background: {
      set image(fit: "stretch", width: 100%, height: 100%)
      background-img
    },
    margin: 1em,
  ) if background-img != none

  set text(fill: white, size: 2em)

  logic.polylux-slide(align(horizon, body))
}