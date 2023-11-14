
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

// Build themes:

#let ThemeFAU = (
  Kennung: image("../assets/FAU/FAUKennung.svg"),
  KennungWhite: image("../assets/FAU/FAUKennungWhite.svg"),
  TitleBackground: image("../assets/FAU/FAUTitle.jpg"),
  BaseColor: FAUBlue,
  BaseDarkColor: FAUDarkBlue,
  SeparationLineColor: FAUBlue.lighten(100% - 62.5%),
  TitleFontColor: white,
)

#let ThemeMed = (
  Kennung: image("../assets/Med/MedKennung.svg"),
  KennungWhite: image("../assets/Med/MedKennungWhite.svg"),
  TitleBackground: image("../assets/Med/MedTitle.jpg"),
  BaseColor: MedBlue,
  BaseDarkColor: MedDarkBlue,
  SeparationLineColor: MedDarkBlue,
  TitleFontColor: white,
)

#let ThemeNat = (
  Kennung: image("../assets/Nat/NatKennung.svg"),
  KennungWhite: image("../assets/Nat/NatKennungWhite.svg"),
  TitleBackground: image("../assets/Nat/NatTitle.jpg"),
  BaseColor: NatGreen,
  BaseDarkColor: NatDarkGreen,
  SeparationLineColor: NatDarkGreen,
  TitleFontColor: white,
)

#let ThemePhil = (
  Kennung: image("../assets/Phil/PhilKennung.svg"),
  KennungWhite: image("../assets/Phil/PhilKennungWhite.svg"),
  TitleBackground: image("../assets/Phil/PhilTitle.jpg"),
  BaseColor: PhilYellow,
  BaseDarkColor: PhilOrange,
  SeparationLineColor: PhilOrange,
  TitleFontColor: black,
)

#let ThemeRW = (
  Kennung: image("../assets/RW/RWKennung.svg"),
  KennungWhite: image("../assets/RW/RWKennungWhite.svg"),
  TitleBackground: image("../assets/RW/RWTitle.jpg"),
  BaseColor: RWRed,
  BaseDarkColor: RWDarkRed,
  SeparationLineColor: RWDarkRed,
  TitleFontColor: white,
)

#let ThemeTech = (
  Kennung: image("../assets/Tech/TechKennung.svg"),
  KennungWhite: image("../assets/Tech/TechKennungWhite.svg"),
  TitleBackground: image("../assets/Tech/TechTitle.jpg"),
  BaseColor: TechMetallic,
  BaseDarkColor: TechDarkMetallic,
  SeparationLineColor: TechDarkMetallic,
  TitleFontColor: white,
)

#let WortmarkeBlue = image("../assets/FAUWortmarkeBlau.svg")
#let WortmarkeWhite = image("../assets/FAUWortmarkeWhite.svg")

#let AllThemes = (
  "FAU": ThemeFAU,
  "Tech": ThemeTech,
  "Med": ThemeMed,
  "Nat": ThemeNat,
  "Phil": ThemePhil,
  "RW": ThemeRW,
)

#let with-theme(callback) = {
  locate(loc => {
    let institution = state("institution").final(loc)
    assert(institution != none)
    let theme = AllThemes.at(institution)
    callback(theme)
  })
}

// Define different shades for BaseColor and BaseDarkColor
#let BaseColorA(theme) = theme.BaseColor.lighten(100% - 62.5%)
#let BaseColorB(theme) = theme.BaseColor.lighten(100% - 37.5%)
#let BaseColorC(theme) = theme.BaseColor.lighten(100% - 25.0%)
#let BaseColorD(theme) = theme.BaseColor.lighten(100% - 12.5%)
#let BaseDarkColorA(theme) = theme.BaseDarkColor.lighten(100% - 62.5%)
#let BaseDarkColorB(theme) = theme.BaseDarkColor.lighten(100% - 37.5%)
#let BaseDarkColorC(theme) = theme.BaseDarkColor.lighten(100% - 25.0%)
#let BaseDarkColorD(theme) = theme.BaseDarkColor.lighten(100% - 12.5%)
