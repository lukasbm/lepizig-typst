#import "@preview/polylux:0.3.1": logic
#import "@preview/polylux:0.3.1": utils

#import "elements.typ": *
#import "colors.typ": *
#import "util.typ": *
#import "fonts.typ": *

///////////////
// Define state
///////////////

#let ascent = 2mm

// sets up state
#let fau-theme(
  aspect-ratio: "16-9",
  short-title: none,
  short-author: none,
  short-date: none,
  institution: "Tech",
  body,
) = {
  // set up global settings
  set page(paper: "presentation-" + aspect-ratio)

  set text(font: FontFamily, size: TextFontSize)

  // define global state (can't define it beforehand, otherwise title slide breaks)
  let _ = state("short-title", short-title)
  let _ = state("short-author", short-author)
  let _ = state("short-date", short-date)
  let _ = state("assets", AllAssets.at(institution))
  let _ = state("color", AllColors.at(institution))
  let _ = state("institution", institution)

  body
}

/////////////////
// slides
/////////////////

#let title-header = locate(
  loc => {
    let col = FAUColors // color(state("institution").at(loc))
    let assets = FAUAssets

    //  FIXME: layout/alignment by using grid or columns ...

    grid(
      columns: (auto, 1fr, auto),
      rows: (auto),
      align(left)[
        // Kennung
        #set image(height: 2cm)
        #assets.KennungWhite
      ],
      align(
        right,
      )[
        // Logo
        #set image(width: config.WordMarkTitleWidth, height: config.WordMarkTitleHeight)
        #WortmarkeWhite
      ],
    )

    // line
    show line: set block(above: 0em, below: 0mm)
    line(length: 200%, stroke: config.LineWidthThick + col.SeparationLineColor)
  },
)

#let title-slide(
  title: "Title",
  subtitle: "Subtitle",
  authors: ("author1", "author 2"),
  institution: "FAU",
  date: datetime.today(),
) = {
  let background-color = FAUBlue
  let background-img = FAUAssets.Title

  set page(background: {
    set image(fit: "stretch", width: 100%, height: 100%)
    background-img
  })

  let content = locate(
    loc => {
      let col = FAUColors // color(state("institution").at(loc))

      // show footnote.entry: set text(size: .6em)

      set text(fill: col.TitleFont)

      // title
      text(size: TitleFontSize, weight: "bold", title)

      // subtitle
      linebreak()
      text(size: SecondFontSize, subtitle)

      // authors
      stack(
        dir: ltr,
        spacing: 1cm,
        ..authors.map(author => text(weight: "bold", size: TextFontSize, author)),
      )

      // author associations
      // TODO:

      // date
      text(size: TextFontSize, date.display("[month repr:long] [day], [year]"))
      // set text(size: .8em, fill: col.TitleFont)
      // grid(
      //   columns: (5cm,) * calc.min(authors.len(), 3),
      //   column-gutter: 1em,
      //   row-gutter: 1em,
      //   ..authors.map(author => text(author)),
      // )
    },
  )

  set page(
    margin: (
      left: config.SideBarWidthLeft,
      top: config.HeaderHeight + ascent,
      right: config.InnerRightMargin,
      bottom: config.FootHeight + ascent,
    ),
    header: title-header,
    footer: none,
    footer-descent: ascent,
    header-ascent: ascent * 2,
  )
  logic.polylux-slide(content)
}

#let header(title: none, subtitle: none) = locate(
  loc => {
    let col = FAUColors // color(state("institution").at(loc))

    grid(
      columns: (auto, 1fr, auto),
      row-gutter: 0pt,
      column-gutter: 1em,
      align(left)[
        // title + subtitle
        #set align(top + left)
        #show text: set block(above: 0em, below: 0em)
        #if title != none {
          text(size: TitleFontSize, weight: "bold", fill: col.BaseColor, title)
        }
        #if title != none and subtitle != none {
          linebreak()
          text(size: SecondFontSize, fill: col.BaseColor, subtitle)
        }
      ],
      [],
      align(right)[
        // Logo
        #set image(width: config.WordMarkWidth, height: config.WordMarkHeight)
        #WortmarkeBlue
      ],
    )

    // line
    show line: set block(above: 0em, below: 0mm)
    line(length: 200%, stroke: config.LineWidthThick + col.SeparationLineColor)
  },
)

#let footer = locate(
  loc => {
    let col = FAUColors // color(state("institution").at(loc))

    // line
    show line: set block(above: 0em, below: 3mm)
    line(length: 200%, stroke: config.LineWidthThin + col.SeparationLineColor)

    // short texts
    set text(FooterFontSize)
    let quad = 0.7cm;
    text("short institution");
    h(quad);
    text("short author");
    h(quad);
    text(col.BaseColor)["short title"];
    h(1fr);
    text("short date");
    h(quad);
    text(logic.logical-slide.display() + [~/~] + utils.last-slide-number);
    h(quad);
  },
)

#let slide(title: none, subtitle: none, body) = {
  set page(
    margin: (
      left: config.SideBarWidthLeft,
      top: config.HeaderHeight + ascent,
      right: config.InnerRightMargin,
      bottom: config.FootHeight + ascent,
    ),
    header: header(title: title, subtitle: subtitle),
    footer: footer,
    footer-descent: ascent,
    header-ascent: ascent * 2,
  )
  logic.polylux-slide(body)
}

#let focus-slide(title: "", body) = slide(title: title, align(center + horizon, body))

#let slide-plain(body) = {
  set page(
    margin: (top: ascent * 2, right: config.InnerRightMargin, bottom: config.FootHeight + ascent),
    header: none,
    footer: footer,
  )
  logic.polylux-slide(body)
}

#let slide-fullscreen(body) = {
  set page(margin: 0em, header: none, footer: none)
  logic.polylux-slide(body)
}

#let toc(highlight: (:)) = {
  set page(margin: (
    left: config.SideBarWidthLeft,
    top: config.HeaderHeight + ascent,
    right: config.InnerRightMargin,
    bottom: config.FootHeight + ascent,
  ), header: none, footer: none, header-ascent: ascent * 2)
  let content = text("filler")
  logic.polylux-slide(content)
}

#let references = slide(title: "References")[
  TODO: print bibliography
]

// TODO: flesh it out to get toc overview (also use toc slide)
#show heading: it => [
  #slide(title: it, body: none)
]
