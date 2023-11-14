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

#let page-with-title-header(theme) = body => {
  body
}

#let page-with-header(theme) = body => {
  body
}

#let page-with-header-and-footer(theme) = body => {
  body
}

#let page-full-screen(theme) = body => {
  body
}

#let page-with-footer(theme) = body => {
  body
}
