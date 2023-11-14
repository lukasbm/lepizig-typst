#import "@preview/polylux:0.3.1": *
#import "../fau-typst.typ": fau-theme, main
#import fau-theme: *

#show: main.fau-theme.with(
  short-author: "Lukas Böhm",
  short-title: "Test Document",
  short-date: datetime.today(),
  short-organization: "Lab1",
)

#polylux-slide[
  need this empty slide at the beginngin due to a bug with state updates

  Issue will be resolved _hopefully_ soon.
]

#title-slide(
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

#slide(title: "Introduction", subtitle: "What is this?")[
  This file demonstrates the usage of the FAU theme for typst.
]

#slide(
  title: "Sections",
  subtitle: "And how to use them",
)[
  Sections in slides are always tricky to handle.

  In this template level 1 headings defined like: `= Heading of level 1` are
  disabled. Instead you use `#section-slide("Title")`. This will register the
  section and generate an overview slide with the current section highlighted.

  The other heading levels should work as intended.

  = Should not show!
  == Should show second level heading
  === and 3rd level as well
]

#slide(title: "Full slide")[
  Slides with too much content are automatically broken up

  #lorem(200)

  *Still the same slide!*
]

#slide(title: "Side by Side", subtitle: "Organizing content on the slide")[
  #align(horizon + center)[
    #side-by-side[
      #lorem(7)
    ][
      #lorem(10)
    ][
      #lorem(5)
    ]
  ]
]

#slide(title: "Blocks")[
  A block is a container for content, it can have a title and any content.

  #fau-block(title: "Block Header")[
    Block content
  ]

  Use any environment (like grid) to shape and align blocks.

  #grid(columns: (1fr, 1fr), gutter: 2em, fau-block()[
    smaller block (no title)
  ], fau-block(title: "hey there")[
    smaller block (with title)
  ])
]

#slide(
  title: "A very very very very very very very very very very long title",
  subtitle: "this should be hidden",
)[
  This is a slide with a very long title, it should be wrapped to the next line
  and the subtitle should be hidden.
]

#slide(title: "Info Environments", subtitle: "`terms`, Lists and Enumerate")[
  #set align(horizon)

  - This is a list
  - with items
    - and inner items

  + This is an enumerate
    + inner enumeration
  + with some more items

  / Term1: A terms element.
  / Term2: With some fancy words.

  Inline `code` is also available.
  ```bash
  echo "and raw code blocks as well"
  ```
]

#slide(
  title: "Graphics",
)[
  #import "../lib/colors.typ": WortmarkeBlue
  #figure(image(WortmarkeBlue.path, width: 75%), caption: "This is a caption") <fig:logo>

  The image @fig:logo is a figure with a caption.
]

// TODO: slide showing off animations/overlays

#section-slide("Color Palette")

#slide(
  title: "Institutional Themes",
)[
  #align(
    horizon,
  )[
    the FAU theme comes with a set of institutional themes, which can be used to
    change the colors of the entire presentation.

    The following options are available:
    - FAU
    - RW
    - Med
    - Nat
    - Tech
  ]
]

// TODO: show off BaseColor, etc.

#section-slide("Slide Environments")

#slide(title: "Normal Slide", subtitle: "With normal dimensions")[
  #box(width: 100%, height: 100%, fill: luma(75%))[
    #align(horizon + center)[
      This is the area you can fill on a normal slide created with:
      ```typst
      #slide(title: "Title")[
      content
      ]
      ```
    ]
  ]
]

#slide-plain[
  #box(width: 100%, height: 100%, fill: luma(75%))[
    #align(horizon + center)[
      more space
    ]
  ]
]

#slide-fullscreen[
  #box(width: 100%, height: 100%, fill: luma(75%))[
    #align(horizon + center)[
      even more space
    ]
  ]
]

#focus-slide(
  title: "Focus Slide",
)[
  This is a focus slide, it is a slide that is not part of the normal flow of the
  presentation, but can be used to focus on a specific topic.

  The content is centered and text looks like a quote.
]

#section-slide("Equations and Math")

#slide(title: "Equations")[
  #align(horizon)[
    $ A = pi r^2 $
    $ "area" = pi dot "radius"^2 $
    $ cal(A) :=
    { x in RR | x "is natural" } $
    #let x = 5
    $ #x < 17 $
  ]
]

#section-slide("Citations")

#slide(title: "Citations")[
  #align(horizon)[
    citation slide empty for now // This is a citation: @cite:example
  ]
]

// FIXME: styling is broken by this point ... due to set page overwrites ... need to scope them
#references-slide

#section-slide("Presentation")

#slide(title: "Notes and `pdfpc`")[
  TODO: explain how to use notes and pdfpc
]
