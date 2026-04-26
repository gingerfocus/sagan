#let ieee(title: "p-set", paper-size: "us-letter", columns: 2, author: "", body) = {
  // Set document metadata.
  set document(title: title, author: author)

  set text(
    // font: "TeX Gyre Termes", 
    size: 12pt, spacing: .35em)

  // Enums numbering
  set enum(numbering: "1)a)i)")

  // Adapt supplement in caption independently from supplement used for
  // references.
  set figure.caption(separator: [. ])
  show figure: fig => {
    let prefix = (
      if fig.kind == table [TABLE]
      else if fig.kind == image [Fig.]
      else [#fig.supplement]
    )
    let numbers = numbering(fig.numbering, ..fig.counter.at(fig.location()))
    // Wrap figure captions in block to prevent the creation of paragraphs. In
    // particular, this means `par.first-line-indent` does not apply.
    // See https://github.com/typst/templates/pull/73#discussion_r2112947947.
    show figure.caption: it => block[#prefix~#numbers#it.separator#it.body]
    show figure.caption.where(kind: table): smallcaps
    fig
  }

  // Code blocks
  show raw: set text(
    // font: "TeX Gyre Cursor",
    ligatures: false,
    size: 1em / 0.8,
    spacing: 100%,
  )

  // Configure the page and multi-column properties.
  // set columns(gutter: 12pt)
  set page(
    columns: columns,
    paper: paper-size,
    // The margins depend on the paper size.
    margin: if paper-size == "a4" {
      (x: 41.5pt, top: 80.51pt, bottom: 89.51pt)
    } else {
      (
        x: (50pt / 216mm) * 100%,
        top: (55pt / 279mm) * 100%,
        bottom: (64pt / 279mm) * 100%,
      )
    }
  )

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

  // Configure appearance of equation references
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      // Override equation references.
      link(it.element.location(), numbering(
        it.element.numbering,
        ..counter(math.equation).at(it.element.location())
      ))
    } else {
      // Other references as usual.
      it
    }
  }

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  // Configure headings.
  set heading(numbering: "I.A.a)")
  show heading: it => {
    // Find out the final number of the heading counter.
    let levels = counter(heading).get()
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }

    // set text(10pt, weight: 400)
    if it.level == 1 {
      // First-level headings are centered smallcaps.
      set align(center)
      set text(16pt)
      show: block.with(above: 15pt, below: 13.75pt, sticky: true)
      show: smallcaps
      numbering("I.", deepest)
      h(7pt, weak: true)
      it.body
    } else if it.level == 2 {
      // Second-level headings are run-ins.
      set text(style: "italic")
      show: block.with(spacing: 10pt, sticky: true)
      if it.numbering != none {
        numbering("A.", deepest)
        h(7pt, weak: true)
      }
      it.body
    } else [
      // Third level headings are run-ins too, but different.
      #if it.level == 3 {
        numbering("a)", deepest)
        [ ]
      }
      _#(it.body):_
    ]
  }

  // Style bibliography.
  show std.bibliography: set text(8pt)
  show std.bibliography: set block(spacing: 0.5em)
  set std.bibliography(title: text(10pt)[References], style: "ieee")

  // set par(justify: true, first-line-indent: (amount: 1em, all: true), spacing: 0.5em, leading: 0.5em)

    {
      show std.title: set align(center)
      show std.title: set text(size: 24pt, weight: "regular")
      std.title()

      set align(center)
      set text(16pt)
      show: smallcaps
      author
    }

    show raw: it => block(
        inset: 1em,
        fill: luma(240),
        stroke: 1pt + black,
        breakable: true
    )[#it]

    body
}

#let codefigure(body, caption: "Example Code") = {
    show figure: set block(breakable: true)
    figure(
        caption: caption,
        kind: "code",
        supplement: [Code Block],
    )[
        #body
    ]
}

#let appendix(body, outline: false) = {
    if (outline) {
        pagebreak()
        outline(target: heading.where(supplement: [Appendix]), title: [Appendix])
    }

  set heading(numbering: "A.", supplement: [Appendix])
  show heading.where(level: 1): it => {
        pagebreak(weak: true)
        it
  }
  counter(heading).update(0)
  body
}

#show table: it => align(center)[#it]

#let callout(body, title: "Callout", fill: blue, title-color: white, body-color: black, icon: none) = {
  block(
    fill: fill,
    width: 100%,
    inset: 8pt
  )[
    #heading(
      numbering: none,
      outlined: false,
      level: 5,
    )[
      #text(title-color)[#icon #title]
    ]
    #text(body-color)[
      #body
    ]
  ]
}

#let prove = callout.with(
  title: "Prove",
  // fill: rgb("#a9afe8"),
  fill: luma(170),
  title-color: black,
  // icon: "✎"
)
#let find = callout.with(
  title: "Find",
  // fill: rgb("#b5ebc3"),
  fill: luma(110),
  title-color: black,
  icon: "?",
)
