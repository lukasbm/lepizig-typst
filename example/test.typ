#import "@preview/polylux:0.3.1": *
#import "../theme/main.typ": *

#set text(font: "FAUSans Office", size: 11pt)

#show: fau-theme.with(
  short-author: "short author",
  short-title: "Short title",
  short-date: "asdasd",
)

#title-slide(
  authors: ("Author A", "Author B"),
  title: "asdasdasdasd",
  subtitle: "Subtitle",
  date: datetime.today(),
  institution-name: "University Name",
  // logo: image("dummy-logo.png", width: 60mm)
)

#slide(title: [Slide title], new-section: [The section])[
  #lorem(40)
]

#focus-slide(background-img: image("../assets/FAU/FAUTitle.jpg"))[
  *Another variant with an image in background...*
]

#matrix-slide[
  left
][
  middle
][
  right
]

#matrix-slide(columns: 1)[
  top
][
  bottom
]

#matrix-slide(columns: (1fr, 2fr, 1fr), ..(lorem(8),) * 9)
