
#let state-to-string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(to-string).join("")
  } else if content.has("body") {
    to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

#let LaTeX = {
  [L];box(move(dx: -4.2pt, dy: -1.2pt, box(scale(65%)[A])));box(move(dx: -5.7pt, dy: 0pt, [T]));box(move(dx: -7.0pt, dy: 2.7pt, box(scale(100%)[E])));box(move(dx: -8.0pt, dy: 0pt, [X]));h(-8.0pt)
}

#let config16by9 = (
  // outer
  SideBarWidthLeft: 14.4mm,
  HeaderHeight: 3.5em, // 5mm,
  HeaderTitleHeight: 4mm,
  TitleHeight: 33mm,
  TitleLineHeight: 10mm,
  TitleTitleSkip: 3.5mm,
  TitleSkip: 5mm,
  TitleSkipLeft: 5.5mm,
  LineWidthThick: 2mm,
  LineWidthThin: .5mm,
  FootHeight: 9mm,
  FootLineSkip: 3mm,
  WordMarkHeight: 17mm,
  WordMarkWidth: 34mm,
  WordMarkTitleHeight: 25.4mm,
  WordMarkTitleWidth: 50.2mm,
  WordMarkLeftHeight: 12mm,
  WordMarkLeftWidth: 74mm,
  WordMarkBoxWidth: 60mm,
  WordMarkSkip: 12mm,
  // inner
  InnerTitleTitleSkip: 3.5mm,
  InnerWordMarkTitleHeight: 21.9mm,
  InnerWordMarkTitleWidth: 55.2mm,
  InnerHeaderHeight: 5mm,
  InnerTitleHeight: 30mm,
  InnerTitleLineHeight: 10mm,
  InnerRightMargin: 3.5mm,
)

#let config4by3 = (
  // outer
  SideBarWidthLeft: 10.8mm,
  HeaderHeight: 5mm,
  HeaderTitleHeight: 4mm,
  TitleHeight: 30mm,
  TitleLineHeight: 10mm,
  TitleTitleSkip: 3.5mm,
  TitleSkip: 2.5mm,
  TitleSkipLeft: 4.5mm,
  LineWidthThick: 2mm,
  LineWidthThin: .5mm,
  FootHeight: 9mm,
  FootLineSkip: 3mm,
  WordMarkHeight: 12.6mm,
  WordMarkWidth: 24.5mm,
  WordMarkTitleHeight: 21.9mm,
  WordMarkTitleWidth: 40.0mm,
  WordMarkLeftHeight: 12mm,
  WordMarkLeftWidth: 50mm,
  WordMarkBoxWidth: 60mm,
  WordMarkSkip: 12mm,
  // inner
  InnerTitleTitleSkip: 3.5mm,
  InnerWordMarkTitleHeight: 25.4mm,
  InnerWordMarkTitleWidth: 46.0mm,
  InnerHeaderHeight: 5mm,
  InnerTitleHeight: 30mm,
  InnerTitleLineHeight: 10mm,
  InnerRightMargin: 3.5mm,
)

#let config = config16by9
