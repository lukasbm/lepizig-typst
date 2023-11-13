#import "@preview/polylux:0.3.1": logic, utils

#import "colors.typ": *
#import "util.typ": *
#import "fonts.typ": *

/////////////////
// components
/////////////////

#let fau-block(title: none, body) = with-theme(
  theme => {
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
  theme: ThemeFAU,
  title: "Title",
  subtitle: none,
  authors: (),
  institution: "FAU",
  date: datetime.today(),
) = {
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

#let toc = with-theme(theme => {
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
  let content = align(horizon)[
    // TODO: if outline.len > 8: #utils.fit-to-height()
    #utils.polylux-outline(enum-args: (full: true))
  ]
  logic.polylux-slide(content)
})

#let references = slide(title: "References")[
  TODO // #fau-block(title: "References")[
  //   #bibliography
  // ]
]

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

  show heading.where(level: 1): it => {
    text(fill: green, it)
    utils.register-section(it)
    toc
    // TODO: make sure headings are not used inside of slides
    // slide(title: it)[
    //   #text("hey there")
    //   #text(utils.polylux-outline())
    // ]
  }

  // change enumerate numbering color
  set enum(
    full: true,
    // FIXME: either use #numbering function or set full: false
    numbering: (..n) => text(fill: theme.BaseColor, [#n.pos().map(x => str(x)).join(".").]),
  )

  // change terms color
  show terms.item: it => {
    text(fill: theme.BaseColor, strong(it.term + ":")) + h(0.5em, weak: true) + text(it.description) + linebreak()
  }
  // show terms: it => {
  //   for i in it.children {
  //     emph(i.term) + h(0.5em) + strong(i.description) + linebreak()
  //   }
  // }
  // show terms: it => list(
  //   marker: none,
  //   body-indent: 0em,
  //   ..it.children //.map(i => emph(i.term) + h(0.5em) + strong(i.description)),
  // )

  // change list bullet color
  set list(marker: (
    text(fill: theme.BaseColor, "•"), // first level
    ..((text(fill: theme.BaseColor, "◦")),) * 100, // next 100 levels
  ))

  // state updates
  state-short-title.update(short-title)
  state-short-author.update(short-author)
  state-short-date.update(short-date)
  state-short-organization.update(short-organization)
  state-institution.update(institution)
  state-theme.update(theme)

  // include document
  body
}
