#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ELEN110 - Lab 1", columns: 1, author: "Evan Stokdyk")
#show raw: set text(10pt)

// set block(breakable: true)
The goal of this lab

= Part 1

#let code1 = read("elen110-lab1-1.m")
#pset.codefigure(caption: "Code for Part 1")[
    #raw(code1, block: true, lang: "asm")
]

#figure(caption: "graph for part 1")[
  #image("P1_fig1.png")
]

= Part 2
#let code2 = read("elen110-lab1-2.m")
#pset.codefigure(caption: "Code for Part 2")[
    #raw(code2, block: true, lang: "asm")
]

#figure(caption: "unscaled graph for part 2")[
  #image("P2_fig1.png")
]

#figure(caption: "scaled graph for part 2")[
  #image("P2_fig2.png")
]
