#import "util.typ": *
#import "components.typ": *

// mostly wrapping default elements like lists with different show rules

#let styled-link(theme) = body => {
  show link: set text(fill: theme.BaseColor)

  body
}

#let styled-enum(theme) = body => {
  set enum(
    full: true,
    numbering: (..n) => text(fill: theme.BaseColor, [#n.pos().map(x => str(x)).join(".").]),
  )
  body
}

// change terms color
#let styled-terms(theme) = body => {
  show terms.item: it => {
    text(fill: theme.BaseColor, strong(it.term + ":")) + h(0.5em, weak: true) + text(it.description) + linebreak()
  }
  body
}

#let styled-list(theme) = body => {
  // show list.item: it => {
  //   text(fill: theme.BaseColor, strong(it.term + ":")) + h(0.5em, weak: true) + text(it.description) + linebreak()
  // }
  set list(marker: (
    text(fill: theme.BaseColor, "•"), // first level
    ..((text(fill: theme.BaseColor, "◦")),) * 100, // next 100 levels
  ))
  body
}

#let page-with-title-header-and-background(theme) = body => {
  set page(
    background: {
      set image(fit: "stretch", width: 100%, height: 100%)
      theme.TitleBackground
    },
    margin: (
      left: config.MarginLeft,
      top: config.HeaderHeight + ascent * 2,
      right: config.MarginRight,
      bottom: config.FooterHeight + ascent,
    ),
    header: title-header(theme),
    footer: none,
    footer-descent: ascent,
    header-ascent: ascent * 2,
  )
  set text(fill: theme.TitleFontColor)

  body
}

#let page-with-title-header-and-fill(theme) = body => {
  set page(
    fill: theme.BaseColor,
    margin: (
      left: config.MarginLeft,
      top: config.HeaderHeight + ascent * 2,
      right: config.MarginRight,
      bottom: config.FooterHeight + ascent,
    ),
    header: title-header(theme),
    footer: none,
    header-ascent: ascent * 2,
    footer-descent: ascent,
  )
  set text(fill: theme.TitleFontColor)

  body
}

#let page-with-header(theme, title, subtitle) = body => {
  set page(
    margin: (
      left: config.MarginLeft,
      top: config.HeaderHeight + ascent * 2,
      right: config.MarginRight,
      bottom: ascent,
    ),
    header: header(title: title, subtitle: subtitle)(theme),
    footer: none,
    footer-descent: ascent,
    header-ascent: ascent * 2,
  )

  body
}

#let page-with-header-and-footer(theme, title, subtitle) = body => {
  set page(
    margin: (
      left: config.MarginLeft,
      top: config.HeaderHeight + ascent * 2,
      right: config.MarginRight,
      bottom: config.FooterHeight + ascent,
    ),
    header: header(title: title, subtitle: subtitle)(theme),
    footer: footer(theme),
    footer-descent: ascent,
    header-ascent: ascent * 2,
  )

  body
}

#let page-with-footer(theme) = body => {
  set page(
    margin: (
      left: config.MarginLeft,
      top: ascent * 2,
      right: config.MarginRight,
      bottom: config.FooterHeight + ascent,
    ),
    header: none,
    footer: footer(theme),
    footer-descent: ascent,
    header-ascent: ascent * 2,
  )

  body
}

#let page-full-screen(theme) = body => {
  set page(margin: 0em, header: none, footer: none)
  body
}

