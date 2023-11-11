#let TitleFontSize = 30pt
#let SecondFontSize = 25pt
#let FooterFontSize = 10pt
#let TextBaseLineSkip = 0.65em
#let TextFontSize = 20pt
#let SmallFontSize = 16pt

#let FontFamily = "FAUSans Office"

#let setup-fonts = {
  show heading: set text(font: FontFamily, weight: "bold", size: TitleFontSize)
}

// only use Regular, Italic, Bold font
// TODO: setup fonts for the different classes!
