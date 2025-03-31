#import "components.typ": *
#import "util.typ": *
#import "fonts.typ": *
#import "@preview/polylux:0.4.0": toolbox, slide as polylux-slide
#import "styles.typ": *


#let title-slide(
  title: "Title",
  subtitle: none,
  authors: (),
  date: datetime.today(), // FIXME: use the global date as default
  body: none,
) = theme => {
  let content = {
    v(1.5cm)

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
    stack(
      dir: ltr,
      spacing: 1cm,
      ..authors.map(author => {
        assert("name" in author)
        text(
          weight: "bold",
          if "email" in author {
            link("mailto:" + author.email, author.name)
          } else {
            author.name
          },
        )
        if "affiliation" in author {
          footnote(author.affiliation)
        }
      }),
    )

    // date
    text(size: TextFontSize, date.display("[month repr:long] [day], [year]"))
    linebreak()

    body
  }

  // needs to be here because of: https://github.com/typst/typst/issues/1467#issuecomment-1588684304
  show footnote.entry: set text(fill: theme.TitleFontColor)
  set footnote.entry(separator: line(length: 30%, stroke: config.LineWidthThin + theme.TitleFontColor))
  show footnote: set text(fill: theme.TitleFontColor)
  show: page-with-title-header-and-background(theme)
  polylux-slide(content)
}

#let slide(title: none, subtitle: none, body) = theme => {
  show: page-with-header-and-footer(theme, title, subtitle)
  show: styled-enum(theme)
  show: styled-terms(theme)
  show: styled-list(theme)
  show: styled-link(theme)
  polylux-slide(body)
}

#let focus-slide(title: none, subtitle: none, body) = theme => {
  show: page-with-header-and-footer(theme, title, subtitle)
  show text: emph
  let content = align(center + horizon, body)
  polylux-slide(content)
}

#let slide-plain(body) = theme => {
  show: page-with-footer(theme)
  polylux-slide(body)
}

#let slide-fullscreen(body) = theme => {
  show: page-full-screen(theme)
  polylux-slide(body)
}

// section overview slide
#let section-slide(title) = theme => {
  show: page-with-title-header-and-fill(theme)

  // styling of the section titles (highlight current one)
  // set enum(
  //   numbering: n => {
  //     if secs.map(x => x.body).at(int(n) - 1) == current-sec {
  //       text(fill: theme.TitleFontColor, [#str(n)])
  //     } else {
  //       text(fill: BaseColorA(theme), [#str(n)])
  //     }
  //   },
  // )

  // actually render the section titles
  set text(size: TitleFontSize, weight: "bold")

  let content = toolbox.all-sections((sections, current) => {
    sections.map(s => if s == current {
      // render the current section title
      text(
        fill: theme.TitleFontColor,
        s.body,
      )
      // [+ #link(loc)[#text(fill: theme.TitleFontColor, current-sec)]]
    } else {
      // render the other section titles
      text(
        fill: BaseColorA(theme),
        s.body,
      )
      // [+ #link(sec.loc)[#text(fill: BaseColorA(theme), sec.body) ]]
    })
  })

  // FIXME: can overflow horizontally (use scaling if more than ~8 sections)
  polylux-slide[
    #align(horizon)[
      #content
    ]
  ]

  // has to be down here due to state update bug
  toolbox.register-section(title)
}
