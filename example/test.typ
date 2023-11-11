#import "@preview/polylux:0.3.1": *
#import "../theme/main.typ": *

#show: fau-theme.with(
  short-author: "Lukas Böhm",
  short-title: "Test Document",
  short-date: datetime.today(),
  institution: "Tech",
)

#title-slide(title: "Test Document showing off the theme", subtitle: "in typst")

// #slide(title: [Slide title], new-section: [The section])[
// ]

#slide(title: "Blocks")[
  #fau-block(title: "test")[
    blokc1
  ]

  #fau-block()[
    block2 (no title)
  ]
]

#slide(title: "Title", subtitle: "Subtitle")[
  #box(width: 100%, height: 100%, fill: luma(80%))[
    #align(horizon + center)[
      just a little test
    ]
  ]
]

#focus-slide(
  title: "Focus Slide",
)[
  This is a focus slide, it is a slide that is not part of the normal flow of the
  presentation, but can be used to focus on a specific topic.
]

// #focus-slide(background-img: image("../assets/FAU/FAUTitle.jpg"))[
//   *Another variant with an image in background...*
// ]
