#import "../lib/colors.typ": ThemeTech;
#let theme = ThemeTech;

#import "../lib/main.typ";
#import "../lib/colors.typ"

// slides
#let title-slide(..args) = main.title-slide(..args)(theme);
#let slide(..args) = main.slide(..args)(theme);
#let slide-plain(..args) = main.slide-plain(..args)(theme);
#let slide-fullscreen(..args) = main.slide-fullscreen(..args)(theme);
#let section-slide(..args) = main.section-slide(..args)(theme);
#let focus-slide(..args) = main.focus-slide(..args)(theme);

// components
#let fau-block(..args) = main.fau-block(..args)(theme);

#let BaseColor = theme.BaseColor;
#let BaseColorA = colors.BaseColorA(theme);
#let BaseColorB = colors.BaseColorB(theme);
#let BaseColorC = colors.BaseColorC(theme);
#let BaseColorD = colors.BaseColorD(theme);
#let BaseDarkColor = theme.BaseDarkColor;
#let BaseDarkColorA = colors.BaseDarkColorA(theme);
#let BaseDarkColorB = colors.BaseDarkColorB(theme);
#let BaseDarkColorC = colors.BaseDarkColorC(theme);
#let BaseDarkColorD = colors.BaseDarkColorD(theme);
