#import "@preview/polylux:0.3.1": *
#import "../theme/main.typ": *

#show: fau-theme.with(
  short-author: "Lukas Böhm",
  short-title: "Test Document",
  short-date: datetime.today(),
  institution: "Tech",
)

#title-slide(title: "Test Document showing off the theme", subtitle: "in typst")

#slide(title: [Slide title], new-section: [The section])[
  hi
]

#slide(title: [Blocks])[
  #fau-block(title: "test")[
    asdasdasd
  ]

  #block()[
    asdasdasd
  ]
]

// #focus-slide(background-img: image("../assets/FAU/FAUTitle.jpg"))[
//   *Another variant with an image in background...*
// ]
