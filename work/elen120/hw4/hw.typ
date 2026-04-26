#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ECEN120 - HW 4", columns: 1, author: "Evan Stokdyk")

= Problem 1

#let text = read("p1.arm")
#pset.codefigure(caption: "Code for Part 1")[
    #raw(text, block: true, lang: "asm")
]

#image("p1.png", alt: [
    ```
    0x20000000:     1       2       3       4
    0x20000010:     5       6       7       8
    0x20000020:     9       10      11      -2

    0x20000030:     3       6       9       12
    0x20000040:     15      18      21      24
    0x20000050:     27      30      33      -6
    ```
])

= Problem 2

#let text = read("p2.arm")
#pset.codefigure(caption: "Modified Code for Part 2")[
  #raw(text, block: true, lang: "asm")
]

#image("p2.png")

= Problem 3

#let text = read("p3.arm")
#pset.codefigure(caption: "Modified Code for Part 3")[
  #raw(text, block: true, lang: "asm")
]

#image("p3.png")
