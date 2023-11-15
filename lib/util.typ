#import "colors.typ": ThemeFAU

//////////////////////
// state stuff
//////////////////////

#let state-short-title = state("short-title", none)
#let state-short-author = state("short-author", none)
#let state-short-date = state("short-date", datetime.today())
#let state-short-organization = state("short-organization", none)

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

//////////////////////
// config
//////////////////////

#let ascent = 2mm

#let LaTeX = {
  [L];box(move(dx: -4.2pt, dy: -1.2pt, box(scale(65%)[A])));box(move(dx: -5.7pt, dy: 0pt, [T]));box(move(dx: -7.0pt, dy: 2.7pt, box(scale(100%)[E])));box(move(dx: -8.0pt, dy: 0pt, [X]));h(-8.0pt)
}

#let TyPsT = {
  [T];box(move(dx: -4.2pt, dy: -1.2pt, box(scale(65%)[Y])));box(move(dx: -5.7pt, dy: 0pt, [P]));box(move(dx: -7.0pt, dy: 2.7pt, box(scale(100%)[S])));box(move(dx: -8.0pt, dy: 0pt, [T]));h(-8.0pt)
}

#let config16by9 = (
  // skips
  TitleSkip: 5mm, // distance left empty on top of header
  FooterSkip: 3mm,
  // margins
  MarginLeft: 14.4mm,
  MarginRight: 3.5mm,
  HeaderHeight: 4.5em,
  FooterHeight: 9mm,
  // separator line
  LineWidthThick: 2mm,
  LineWidthThin: .5mm,
  // wortmarke logo
  WordMarkTitleHeight: 25.4mm, // height if placed in title
  WordMarkTitleWidth: 50.2mm, // width if placed in title
  WordMarkHeight: 17mm, // regular height
  WordMarkWidth: 34mm, //regular width
  WordMarkLeftHeight: 12mm, // height if placed left
  WordMarkLeftWidth: 74mm, // width if placed left
  WordMarkBoxWidth: 60mm, // width reserved for wordmark
  WordMarkSkip: 12mm, // gutter before wordmark space
  // kennung
  KennungHeight: 18mm,
)

#let config = config16by9
