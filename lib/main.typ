#import "@preview/polylux:0.3.1": logic, utils

#import "colors.typ": *
#import "util.typ": *
#import "fonts.typ": *
#import "styles.typ": *

/////////////////
// components
/////////////////

// FIXME: the combinatation of set-page(header, etc...) breaks the following slide!!!
// TODO: extract page setup into functions

#let fau-block(title: none, body) = theme => {
  let content = block(width: 100%, breakable: false, fill: luma(80%), inset: 5pt, body)

  let header = if title != none {
    set text(theme.TitleFontColor, weight: "bold")
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
}

#let title-header = theme => {
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
}

#let header(title: none, subtitle: none) = theme => {
  grid(
    columns: (70%, 1fr, auto),
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
    align(top + right)[
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
}

#let footer = theme => {
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
}

/////////////////////
// slides
/////////////////////

#let title-slide(
  title: "Title",
  subtitle: none,
  authors: (),
  institution: "FAU",
  date: datetime.today(),
) = theme => {
  // needs to be here because of: https://github.com/typst/typst/issues/1467#issuecomment-1588684304
  show footnote.entry: set text(fill: theme.TitleFontColor)
  show footnote: set text(fill: theme.TitleFontColor)

  let content = {
    v(1.5cm)

    set text(fill: theme.TitleFontColor)

    // title
    text(size: TitleFontSize, weight: "bold", title)

    // subtitle
    if subtitle != none {
      linebreak()
      text(size: SecondFontSize, subtitle)
    }

    v(0.5cm)

    // authors
    // FIXME: this can overflow horizontally
    stack(dir: ltr, spacing: 1cm, ..authors.map(author =>{
      assert("name" in author)
      text(weight: "bold", size: TextFontSize, if "email" in author {
        link("mailto:" + author.email, author.name)
      } else {
        author.name
      })
      if "affiliation" in author {
        footnote(author.affiliation)
      }
    }))

    // date
    text(size: TextFontSize, date.display("[month repr:long] [day], [year]"))
  }

  set page(
    background: {
      set image(fit: "stretch", width: 100%, height: 100%)
      theme.TitleBackground
    },
    margin: (
      left: config.SideBarWidthLeft,
      top: config.HeaderHeight + ascent,
      right: config.InnerRightMargin,
      bottom: config.FootHeight + ascent,
    ),
    header: title-header(theme),
    footer: none,
    footer-descent: ascent,
    header-ascent: ascent * 2,
  )

  logic.polylux-slide(content)
}

#let slide(title: none, subtitle: none, body) = theme => {
  set page(
    margin: (
      left: config.SideBarWidthLeft,
      top: config.HeaderHeight + ascent,
      right: config.InnerRightMargin,
      bottom: config.FootHeight + ascent,
    ),
    header: header(title: title, subtitle: subtitle)(theme),
    footer: footer(theme),
    footer-descent: ascent,
    header-ascent: ascent * 2,
  )
  show: styled-enum(theme)
  show: styled-terms(theme)
  show: styled-list(theme)

  logic.polylux-slide(body)
}

#let focus-slide(title: "", body) = theme => slide(title: title, align(center + horizon, body))(theme)

#let slide-plain(body) = theme => {
  set page(margin: (
    top: ascent * 2,
    right: config.InnerRightMargin,
    bottom: config.FootHeight + ascent,
  ), header: none, footer: footer(theme))
  logic.polylux-slide(body)
}

#let slide-fullscreen(body) = theme => {
  set page(margin: 0em, header: none, footer: none)
  logic.polylux-slide(body)
}

#let references-slide = theme => slide(title: "References")[
  TODO reference slide! // #fau-block(title: "References")[
  //   #bibliography
  // ]
](theme)

#let section-slide(title) = theme => {
  utils.register-section(title)

  set page(fill: theme.BaseColor)
  set text(size: TitleFontSize, weight: "bold", fill: theme.TitleFontColor)
  set page(
    margin: (
      left: config.SideBarWidthLeft,
      top: config.HeaderHeight + ascent,
      right: config.InnerRightMargin,
      bottom: config.FootHeight + ascent,
    ),
    header: title-header,
    footer: none,
    header-ascent: ascent * 2,
    background: block(width: 100%, height: 100%, fill: theme.BaseColor),
  )
  set text(fill: theme.TitleFontColor)

  locate(loc => {
    let secs = utils.sections-state.final(loc)
    let current-sec = utils.current-section

    // show rule to highligh current section (maybe have to use regex)
    // show current-sec: set text(fill: red)

    // renders the a sections (highlighted if current-section)
    let section-entry(sec) = {
      if sec == current-sec {
        set text(fill: red)
      }
      [ + #sec ]
    }

    slide(title: title)[
      #for sec in secs {
        section-entry(sec.body) // TODO: turn into a link with sec.loc
      }
    ]
  })
}

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
  let theme = AllThemes.at(institution)

  // global style setup
  set page(paper: "presentation-" + aspect-ratio)
  set text(font: FontFamily, size: TextFontSize)
  // set block(spacing: 1em)

  // essentially disable level 1 headings
  show heading.where(level: 1): it => {}

  // state updates
  state-short-title.update(short-title)
  state-short-author.update(short-author)
  state-short-date.update(short-date)
  state-short-organization.update(short-organization)

  // include document
  body
}
