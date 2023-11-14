#import "../lib/main.typ";
#import "../lib/colors.typ": ThemeFAU;

#let title-slide(..args, body) = main.title-slide(..args, body)(ThemeFAU);
#let slide(..args, body) = main.slide(..args, body)(ThemeFAU);
#let slide-plain(..args, body) = main.slide-plain(..args, body)(ThemeFAU);
#let slide-fullscreen(..args, body) = main.slide-fullscreen(..args, body)(ThemeFAU);
#let section-slide(..args, body) = main.section-slide(..args, body)(ThemeFAU);
#let references-slide(..args, body) = main.references-slide(..args, body)(ThemeFAU);
#let focus-slide(..args, body) = main.focus-slide(..args, body)(ThemeFAU);
