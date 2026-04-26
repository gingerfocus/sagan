#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ELEN110 - Lab 3", columns: 1, author: "Evan Stokdyk")
#show raw: set text(10pt)

= Equation
$
  y(t) &= 0         &&quad "if" & &t lt.eq -0.75 \
  y(t) &= t + 0.75  &&quad "if" & -0.25 gt.eq &t gt.eq -0.75 \
  y(t) &= 0.5       &&quad "if" & 0.25 gt.eq &t gt.eq -0.25 \
  y(t) &= 0.75 - t  &&quad "if" & 0.75 gt.eq &t gt.eq 0.25 \
  y(t) &= 0         &&quad "if" & &t gt.eq 0.75 \
$
= Figure
#figure(caption: "signal x(t) made with rectpuls")[
  #image("Lab4-P1.png")
]

