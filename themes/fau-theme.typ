#import "../lib/main.typ";
#import "../lib/colors.typ": ThemeFAU;

// slides
#let title-slide(..args) = main.title-slide(..args)(ThemeFAU);
#let slide(..args) = main.slide(..args)(ThemeFAU);
#let slide-plain(..args) = main.slide-plain(..args)(ThemeFAU);
#let slide-fullscreen(..args) = main.slide-fullscreen(..args)(ThemeFAU);
#let section-slide(..args) = main.section-slide(..args)(ThemeFAU);
#let focus-slide(..args) = main.focus-slide(..args)(ThemeFAU);

// components
#let fau-block(..args) = main.fau-block(..args)(ThemeFAU);
