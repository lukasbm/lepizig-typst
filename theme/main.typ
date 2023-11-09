#import "@preview/polylux:0.3.1": logic
#import "@preview/polylux:0.3.1": utils

#import "elements.typ": *
#import "colors.typ": *

#let fau_short_title = state("fau_short_title", "")
#let fau_short_author = state("fau_short_author", "")
#let fau_short_date = state("fau_short_date", "")
#let fau_institution = state("fau-institution", "FAU")

///////////////
// Define state
///////////////

// sets up state
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

  body // HAS TO BE HERE OTHERWISE BROKEN (this also causes the layout convergence issue!)

  fau_institution.update(institution)
  fau_short_title.update(short-title)
  fau_short_author.update(short-author)
  fau_short_date.update(short-date)
  
}

/////////////////
// slides
/////////////////

#let title-slide(
  title: "Title",
  subtitle: "Subtitle",
  authors: ("author1", "author 2"),
  institution: "FAU",
  date: datetime.today(),
) = {
  let background-color = FAUBlue
  let background-img = FAUAssets.Title

  set text(fill: white, font: "FAUSans Office", size: 20pt)
  set page(background: {
    set image(fit: "stretch", width: 100%, height: 100%)
    background-img
  }, margin: 1em)

  let content = locate(loc => {
    let colors = (a: FAUBlue, b: FAUBlue, c: FAUBlue)

    // let logo = WortmarkeBlue
    // if logo != none {
    //   align(right, logo)
    // }

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
      let institution-name = "test"
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

  logic.polylux-slide(text(content))
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
          let colors = (a: FAUBlue, b: FAUBlue, c: FAUBlue)
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
        let colors = (a: FAUBlue, b: FAUBlue, c: FAUBlue)

        show: block.with(width: 100%, height: auto, fill: colors.b)
        grid(
          columns: (25%, 1fr, 15%, 10%),
          rows: (1.5em, auto),
          cell(fill: colors.a, fau_short_author.display()),
          cell(fau_short_title.display()),
          cell(fau_short_date.display()),
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
