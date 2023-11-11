#import "colors.typ": *

#let fau-block(title: none, body) = locate(
  loc => {
    let col = FAUColors // state("colors").at(loc)

    let content = block(width: 100%, breakable: false, fill: luma(80%), inset: 5pt, body)

    let header = if title != none {
      set text(white)
      set text(weight: "bold")
      block(width: 100%, breakable: false, fill: col.BaseColor, inset: 5pt, title)
    } else {
      block(width: 100%, height: 2mm, breakable: false, fill: col.BaseColor)
    }

    stack(dir: ttb, header, content)
  },
)

// #show block: fau-block
