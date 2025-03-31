#import "util.typ": *
#import "fonts.typ": *
#import "colors.typ": *
#import "@preview/polylux:0.4.0": toolbox

#let fau-block(title: none, body) = theme => {
  // FIXME: make the fill color of content dependent on the theme
  // It should still be grayscale?
  let content = block(width: 100%, breakable: false, fill: luma(95%), inset: 5pt, body)

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
  // kennung and wortmarke
  grid(
    columns: (1fr, config.WordMarkBoxWidth),
    column-gutter: config.WordMarkSkip,
    rows: config.HeaderHeight,
    align(horizon + left)[
      #set image(height: config.KennungHeight)
      #theme.KennungWhite
    ],
    align(top + right)[
      // Logo
      #set image(width: config.WordMarkTitleWidth, height: config.WordMarkTitleHeight)
      #pad(y: 10pt, x: 5pt, WortmarkeWhite)
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
  // title, subtitle and wortmarke
  grid(
    columns: (1fr, config.WordMarkBoxWidth),
    column-gutter: config.WordMarkSkip,
    rows: config.HeaderHeight,
    align(top + left)[
      #v(config.TitleSkip)
      #show text: set block(above: 0em, below: 0em)
      #if title != none {
        text(size: TitleFontSize, weight: "bold", fill: theme.BaseColor, title)
      }
      #if title != none and subtitle != none {
        linebreak()
        text(size: SecondFontSize, fill: theme.BaseColor, subtitle)
      }
    ],
    align(top + right)[
      // Logo
      #set image(width: config.WordMarkWidth, height: config.WordMarkHeight)
      #pad(y: 10pt, x: 5pt, WortmarkeBlue)
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
  show line: set block(above: 0mm, below: 3mm)
  line(length: 200%, stroke: config.LineWidthThin + theme.SeparationLineColor)

  // short texts
  set text(FooterFontSize)
  let quad = 0.7cm
  context text(state-short-organization.get())
  h(quad)
  context text(state-short-author.get())
  h(quad)
  context text(fill: theme.BaseColor, state-short-title.get())
  h(1fr)
  context text(state-short-date.get().display("[month repr:short] [day], [year]"))
  h(quad)
  // FIXME: does this work???
  text(toolbox.slide-number + [~/~] + toolbox.last-slide-number)
  h(quad)
}
