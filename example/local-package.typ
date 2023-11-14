#import "@local/fau-typst:0.0.1": tech-theme
#import tech-theme: *

#show: main.fau-theme.with(
  short-author: "Lukas Böhm",
  short-title: "Test Document",
  short-date: datetime.today(),
  short-organization: "Lab1",
  institution: "FAU",
)

#main.title-slide(
  theme: main.ThemeFAU, // FIXME: this should not be needed
  title: "Test Document showing off the theme",
  subtitle: "in Typst, the new Markup Language",
  authors: (
    (
      name: "Theresa Tungsten",
      affiliation: "Artos Institute",
      email: "tung@artos.edu",
    ),
    (name: "Eugene Deklan", affiliation: "Honduras State"),
    (name: "Lukas Böhm"),
  ),
)

#main.slide(title: "Introduction", subtitle: "What is this?")[
  This file demonstrates the usage of the FAU theme for typst.
]
