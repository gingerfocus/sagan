#let type(paper-size: "us-letter", body) = {
  let font-size = 10pt;
  set text(font: "New Computer Modern Mono", size: font-size, hyphenate: false, fill: black)

  show heading: set text(size: font-size)
  show heading.where(level: 1): underline
  show heading.where(level: 2): strong
  show heading.where(level: 3): emph

  set par(leading: 0.5em, spacing: 0.5em, first-line-indent: 4em)
  // #set par.line(numbering: "1", numbering-scope: "page")

  set page(
      paper: paper-size,
      // fill: rgb("704214"), // cda882
      // background: rotate(24deg, text(48pt, fill: rgb("FFCBC4"))[
      //     *CONFIDENTIAL*
      // ]
  )

  body
}

