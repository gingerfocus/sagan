#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ELEN110 - Lab 5", columns: 1, author: "Evan Stokdyk")
#show raw: set text(10pt)

= Questions
*Describe which signal (or function) does the output represent.*

The output signal in part 1 looks like a step function which is identical to
the input.

*Explain what happens to the input after the Derivative block.*

The function looks like the unit impulse function with a magnitude of 1.

*Explain what happens to the input after the Integrator block.*

The integrator block turns the function back into a step function.

*Compare the outputs on Scope 1 and Scope 3. Are they the same? Why?*

The amplitude of the output is significantly lower than the input. This is due
to rounding errors and the fact that it is doing integrals using discrete time
step Riemann sum which will have large errors for very fine inputs (which the
impulse function is).

= Graphs
#figure(caption: "Output from part 2 and 3")[
  #grid(
    columns: (1fr, 1fr), // Two equal-width columns
    gutter: 10pt,        // Space between images
    image("part1.png"),
    image("part2.png"),
  )
]

