//////////
// define colors and their dark versions
/////////

// FAU University colors
#let FAUBlue = rgb(0, 47, 108)
#let FAUDarkBlue = rgb(4, 30, 66)

// Phil colors
#let PhilYellow = rgb(255, 184, 28)
#let PhilOrange = rgb(232, 119, 34)

// RW colors
#let RWRed = rgb(200, 16, 46)
#let RWDarkRed = rgb(151, 27, 47)

// Med colors
#let MedBlue = rgb(0, 163, 224)
#let MedDarkBlue = rgb(0, 97, 160)

// Nat colors
#let NatGreen = rgb(67, 176, 42)
#let NatDarkGreen = rgb(34, 136, 72)

// Tech colors
#let TechMetallic = rgb(119, 159, 181)
#let TechDarkMetallic = rgb(65, 116, 141)

////////////////////////
// Assign the colors
//   - BaseColor
//  - BaseDarkColor
// according to the specified institute.
////////////////////////

// #let darken(color, amount) = color.mix(color,  black, amount)
#let darken(color, amount) = color.mix(color, luma(amount))

#let TitleFont = white

#let FAUColors = (
  BaseColor: FAUBlue,
  BaseDarkColor: FAUDarkBlue,
  SeparationLineColor: darken(FAUBlue, 62.5),
)

#let PhilColors = (
  BaseColor: PhilYellow,
  BaseDarkColor: PhilOrange,
  SeparationLineColor: PhilOrange,
  TitleFont: black,
)

#let RWColors = (
  BaseColor: RWRed,
  BaseDarkColor: RWDarkRed,
  SeparationLineColor: RWDarkRed,
)

#let MedColors = (
  BaseColor: MedBlue,
  BaseDarkColor: MedDarkBlue,
  SeparationLineColor: MedDarkBlue,
)

#let NatColors = (
  BaseColor: NatGreen,
  BaseDarkColor: NatDarkGreen,
  SeparationLineColor: NatDarkGreen,
)

#let TechColors = (
  BaseColor: TechMetallic,
  BaseDarkColor: TechDarkMetallic,
  SeparationLineColor: TechDarkMetallic,
)

/////////////////////////
// Define different shades for BaseColor and BaseDarkColor
/////////////////////////

// FIXME: dependent on state!
// #let BaseColorA = darken(BaseColor, 62.5)
// #let BaseColorB = darken(BaseColor, 37.5)
// #let BaseColorC = darken(BaseColor, 25.0)
// #let BaseColorD = darken(BaseColor, 12.5)

// #let BaseDarkColorA = darken(BaseDarkColor, 62.5)
// #let BaseDarkColorB = darken(BaseDarkColor, 37.5)
// #let BaseDarkColorC = darken(BaseDarkColor, 25.0)
// #let BaseDarkColorD = darken(BaseDarkColor, 12.5)
