#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ELEN110 - Lab 2", columns: 1, author: "Evan Stokdyk")
#show raw: set text(10pt)

= Part 1 - Signal Transformation
=== Step 4
$y_1(t) = x(-t)$

=== Step 5
$y_2(t) = -x(t)$

=== Step 6
$y_3(t) = x(t-3)+2$

=== Step 7
$y_4(t) = 1/2 x(3*t)$

=== Step 8
$y_5(t) = x(1/2 (t+2) ) -1$

== Figure
#figure(caption: "graph for part 1")[
  #image("Lab2-P1.png")
]

= Part 2 - Listening to Signals
=== Step 2
Briefly describe what is happening to the signal in terms of amplitude.

There is a high frequency wave that increase in amplitude exponentially over
time.

=== Step 5
Why does the sound change following signal time reversal?

It goes from pitching up to pitching down which changes the vibe.

=== Step 6
Why does the sound duration change following frequency doubling?

I changed the frequency by down sampling as I could not figure out how to
increase the playback speed. As such the lenght of the array decreased and
thus the playback.

== Figure
#figure(caption: "scaled for part 2")[
  #image("Lab2-P2.png")
]

= Part 3 - Adding Harmonics
=== Step 2
What is different between f(x) and g(x)?

The sound of $f$ is inaudible in some context for me but when it can be heard
it is a very low tone. The sound of g is very high and sounds shrill.

=== Part 3
In terms of the sound of added f(t) & g(t), what is different?

The sound has harmonics by combining both. This makes it sound not only more
interesting but less shrill and less low.

== Figure
#figure(caption: "combined graph for part 3")[
  #image("Lab2-P3.png")
]
