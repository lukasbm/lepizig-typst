#import "components.typ": *
#import "util.typ": *
#import "fonts.typ": *
#import "@preview/polylux:0.3.1": logic, utils
#import "styles.typ": *

#let title-slide(
  title: "Title",
  subtitle: none,
  authors: (),
  institution: "FAU",
  date: datetime.today(),
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

  // needs to be here because of: https://github.com/typst/typst/issues/1467#issuecomment-1588684304
  show footnote.entry: set text(fill: theme.TitleFontColor)
  show footnote: set text(fill: theme.TitleFontColor)
  show: page-with-title-header-and-background(theme)
  logic.polylux-slide(content)
}

#let slide(title: none, subtitle: none, body) = theme => {
  show: page-with-header-and-footer(theme, title, subtitle)
  show: styled-enum(theme)
  show: styled-terms(theme)
  show: styled-list(theme)
  logic.polylux-slide(body)
}

#let focus-slide(title: none, subtitle: none, body) = theme => {
  show: page-with-header-and-footer(theme, title, subtitle)
  show text: emph
  let content = align(center + horizon, body)
  logic.polylux-slide(content)
}

#let slide-plain(body) = theme => {
  show: page-with-footer(theme)
  logic.polylux-slide(body)
}

#let slide-fullscreen(body) = theme => {
  show: page-full-screen(theme)
  logic.polylux-slide(body)
}

#let section-slide(title) = theme => {
  show: page-with-title-header-and-fill(theme)

  locate(
    loc => {
      let secs = utils.sections-state.final(loc) // every entry has body and loc
      let current-sec = title // utils.current-section

      // FIXME: colors
      let render-section(sec) = {
        if sec.body == current-sec {
          [ + #link(loc)[#text(fill: theme.TitleFontColor, current-sec)] ]
        } else {
          [ + #link(sec.loc)[#text(fill: BaseColorA(theme), sec.body) ] ]
        }
      }

      set enum(numbering: n => {
        if secs.map(x => x.body).at(int(n) - 1) == current-sec {
          text(fill: theme.TitleFontColor, [#str(n)])
        } else {
          text(fill: BaseColorA(theme), [#str(n)])
        }
      })

      // FIXME: can overflow horizontally
      logic.polylux-slide[
        #align(horizon)[
          #for sec in secs {
            render-section(sec)
          }
        ]
      ]
    },
  )
  // has to be down here due to state update bug
  utils.register-section(title)
}
