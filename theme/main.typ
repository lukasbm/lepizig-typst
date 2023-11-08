#import "@preview/polylux:0.3.1": logic
#import "@preview/polylux:0.3.1": utils

#import "elements.typ": *
#import "colors.typ": *


#let fau-colors = state(
  "fau-colors",
  (a: rgb("#0C6291"), b: rgb("#A63446"), c: rgb("#FBFEF9")),
)
#let fau-short-title = state("fau-short-title", none)
#let fau-short-author = state("fau-short-author", none)
#let fau-short-date = state("fau-short-date", none)
#let fau-institution = state("fau-institution", none)


#let fau-theme(
  aspect-ratio: "16-9",
  short-title: none,
  short-author: none,
  short-date: none,
  institution: "tech",
  body,
) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: 0em,
    header: none,
    footer: none,
  )
  set text(font: "FAUSans Office", size: 24pt)
  show footnote.entry: set text(size: .6em)

  fau-short-title.update(short-title)
  fau-short-author.update(short-author)
  fau-short-date.update(short-date)

  body
}

#let title-slide(
  title: [],
  subtitle: none,
  authors: (),
  institution-name: "University",
  date: none,
  logo: none,
) = {
  set text(font: "FAUSans Office", size: 25pt)

  let authors = if type(authors) == "array" { authors } else { (authors,) }

  let content = locate(loc => {
    let colors = fau-colors.at(loc)

    if logo != none {
      align(right, logo)
    }

    align(center + horizon, {
      block(inset: 0em, breakable: false, {
        text(size: 2em, fill: colors.a, strong(title))
        if subtitle != none {
          parbreak()
          text(size: 1.2em, fill: colors.a, subtitle)
        }
      })
      set text(size: .8em)
      grid(
        columns: (1fr,) * calc.min(authors.len(), 3),
        column-gutter: 1em,
        row-gutter: 1em,
        ..authors.map(author => text(fill: black, author)),
      )
      v(1em)
      if institution-name != none {
        parbreak()
        text(size: .9em, institution-name)
      }
      if date != none {
        parbreak()
        date.display()
      }
    })
  })

  logic.polylux-slide(content)
}

#let slide(title: none, header: none, footer: none, new-section: none, body) = {
  let body = pad(x: 2em, y: .5em, body)

  let header-text = {
    if header != none {
      header
    } else if title != none {
      if new-section != none {
        utils.register-section(new-section)
      }
      locate(
        loc => {
          let colors = fau-colors.at(loc)
          block(
            fill: colors.c,
            inset: (x: .5em),
            grid(
              columns: (60%, 40%),
              align(top + left, heading(level: 2, text(fill: colors.a, title))),
              align(top + right, text(fill: colors.a.lighten(65%), utils.current-section)),
            ),
          )
        },
      )
    } else { [] }
  }

  let header = {
    set align(top)
    grid(rows: (auto, auto), row-gutter: 3mm, header-text)
  }

  let footer = {
    set text(size: 10pt)
    set align(center + bottom)
    let cell(fill: none, it) = rect(
      width: 100%,
      height: 100%,
      inset: 1mm,
      outset: 0mm,
      fill: fill,
      stroke: none,
      align(horizon, text(fill: white, it)),
    )
    if footer != none {
      footer
    } else {
      locate(loc => {
        let colors = fau-colors.at(loc)

        show: block.with(width: 100%, height: auto, fill: colors.b)
        grid(
          columns: (25%, 1fr, 15%, 10%),
          rows: (1.5em, auto),
          cell(fill: colors.a, fau-short-author.display()),
          cell(fau-short-title.display()),
          cell(fau-short-date.display()),
          cell(logic.logical-slide.display() + [~/~] + utils.last-slide-number),
        )
      })
    }
  }

  set page(
    margin: (top: 2em, bottom: 1em, x: 0em),
    header: header,
    footer: footer,
    footer-descent: 0em,
    header-ascent: .6em,
  )

  logic.polylux-slide(body)
}

#let focus-slide(background-color: none, background-img: none, body) = {
  let background-color = if background-img == none and background-color == none {
    rgb("#0C6291")
  } else {
    background-color
  }

  set page(fill: background-color, margin: 1em) if background-color != none
  set page(background: {
    set image(fit: "stretch", width: 100%, height: 100%)
    background-img
  }, margin: 1em) if background-img != none

  set text(fill: white, size: 2em)

  logic.polylux-slide(align(horizon, body))
}

#let matrix-slide(columns: none, rows: none, ..bodies) = {
  let bodies = bodies.pos()

  let columns = if type(columns) == "integer" {
    (1fr,) * columns
  } else if columns == none {
    (1fr,) * bodies.len()
  } else {
    columns
  }
  let num-cols = columns.len()

  let rows = if type(rows) == "integer" {
    (1fr,) * rows
  } else if rows == none {
    let quotient = calc.quo(bodies.len(), num-cols)
    let correction = if calc.rem(bodies.len(), num-cols) == 0 { 0 } else { 1 }
    (1fr,) * (quotient + correction)
  } else {
    rows
  }
  let num-rows = rows.len()

  if num-rows * num-cols < bodies.len() {
    panic(
      "number of rows (" + str(num-rows) + ") * number of columns (" + str(num-cols) + ") must at least be number of content arguments (" + str(bodies.len()) + ")",
    )
  }

  let cart-idx(i) = (calc.quo(i, num-cols), calc.rem(i, num-cols))
  let color-body(idx-body) = {
    let (idx, body) = idx-body
    let (row, col) = cart-idx(idx)
    let color = if calc.even(row + col) { white } else { silver }
    set align(center + horizon)
    rect(inset: .5em, width: 100%, height: 100%, fill: color, body)
  }

  let content = grid(
    columns: columns,
    rows: rows,
    gutter: 0pt,
    ..bodies.enumerate().map(color-body),
  )

  logic.polylux-slide(content)
}