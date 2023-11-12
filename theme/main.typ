#import "@preview/polylux:0.3.1": logic, utils

#import "colors.typ": *
#import "util.typ": *
#import "fonts.typ": *

///////////////
// Setup
///////////////

#let fau-theme(
  aspect-ratio: "16-9",
  short-title: none,
  short-author: none,
  short-date: none,
  short-organization: none,
  institution: "FAU",
  body,
) = {
  // set up global settings
  set page(paper: "presentation-" + aspect-ratio)

  set text(font: FontFamily, size: TextFontSize)

  // define global state (can't define it beforehand, otherwise title slide breaks)
  state-short-title.update(short-title)
  state-short-author.update(short-author)
  state-short-date.update(short-date)
  state-short-organization.update(short-organization)
  state-institution.update(institution)
  state-theme.update(AllThemes.at(institution))

  body
}

/////////////////
// components
/////////////////

#let fau-block(title: none, body) = with-theme(
  theme => {
    let content = block(width: 100%, breakable: false, fill: luma(80%), inset: 5pt, body)

    let header = if title != none {
      set text(white)
      set text(weight: "bold")
      block(
        width: 100%,
        breakable: false,
        fill: theme.BaseColor,
        inset: 5pt,
        title,
      )
    } else {
      block(width: 100%, height: 2mm, breakable: false, fill: theme.BaseColor)
    }

    stack(dir: ttb, header, content)
  },
)

#let title-header = with-theme(
  theme => {
    //  FIXME: layout/alignment by using grid or columns ...
    grid(
      columns: (auto, 1fr, auto),
      rows: (auto),
      align(left)[
        // Kennung
        #set image(height: 2cm)
        #theme.KennungWhite
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
    line(
      length: 200%,
      stroke: config.LineWidthThick + theme.SeparationLineColor,
    )
  },
)

#let header(title: none, subtitle: none) = with-theme(theme => {
  grid(
    columns: (auto, 1fr, auto),
    row-gutter: 0pt,
    column-gutter: 1em,
    align(left)[
      // title + subtitle
      #set align(top + left)
      #show text: set block(above: 0em, below: 0em)
      #if title != none {
        text(size: TitleFontSize, weight: "bold", fill: theme.BaseColor, title)
      }
      #if title != none and subtitle != none {
        linebreak()
        text(size: SecondFontSize, fill: theme.BaseColor, subtitle)
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
  line(
    length: 200%,
    stroke: config.LineWidthThick + theme.SeparationLineColor,
  )
})

#let footer = with-theme(
  theme => {
    // line
    show line: set block(above: 0em, below: 3mm)
    line(length: 200%, stroke: config.LineWidthThin + theme.SeparationLineColor)

    // short texts
    set text(FooterFontSize)
    let quad = 0.7cm;
    text(state-short-organization.display());
    h(quad);
    text(state-short-author.display());
    h(quad);
    text(fill: theme.BaseColor, state-short-title.display());
    h(1fr);
    text(
      state-short-date.display(dat => dat.display("[month repr:short] [day], [year]")),
    );
    h(quad);
    text(logic.logical-slide.display() + [~/~] + utils.last-slide-number);
    h(quad);
  },
)

/////////////////////
// slides
/////////////////////

#let title-slide(
  title: "Title",
  subtitle: "Subtitle",
  authors: ("author1", "author 2"),
  institution: "FAU",
  date: datetime.today(),
) = {
  let background-color = FAUBlue
  let background-img = ThemeFAU.TitleBackground

  set page(background: {
    set image(fit: "stretch", width: 100%, height: 100%)
    background-img
  })

  let content = with-theme(
    theme => {
      // show footnote.entry: set text(size: .6em)
      set text(fill: theme.TitleFontColor)

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
  set page(margin: (
    top: ascent * 2,
    right: config.InnerRightMargin,
    bottom: config.FootHeight + ascent,
  ), header: none, footer: footer)
  logic.polylux-slide(body)
}

#let slide-fullscreen(body) = {
  set page(margin: 0em, header: none, footer: none)
  logic.polylux-slide(body)
}

// FIXME: use polylux outline
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

////////////////////////
// apply slides
//////////////////////

// TODO: flesh it out to get toc overview (also use toc slide)
#show heading: it => [
  // util.register-section?
  #slide(title: it, body: none)
]
