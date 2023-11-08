#let fau-block(title: none, body) = {
  if title != none {
    block(
      width: 100%,
      breakable: false,
      fill: blue, // FIXME: use the one from the state
      outset: 10pt, // TODO: tweak this
      below: 20pt,
      clip: false,
      title,
    )
  }
  block(
    width: 100%,
    breakable: false,
    fill: luma(230), // FIXME: use the one from the state
    inset: 10pt, // TODO: tweak this
    outset: 10pt, // TODO: tweak this
    spacing: 10pt,
    clip: false,
    body,
  )
}

// #show block: fau-block
