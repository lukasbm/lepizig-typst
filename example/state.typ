#let RedTheme = (light: rgb(255, 0, 0), dark: rgb(128, 0, 0))

#let GreenTheme = (light: rgb(0, 255, 0), dark: rgb(0, 128, 0))

#let AllThemes = (theme1: RedTheme, theme2: GreenTheme)

#let theme = state("theme", GreenTheme)

// sets up state
#let template(user-theme: "", body) = {
  theme.update(AllThemes.at(user-theme))

  body
}

#show: template.with(user-theme: "theme2")

#let color = state("theme").display()
