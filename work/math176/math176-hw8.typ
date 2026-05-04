#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "MATH176 - Homework 8", columns: 1, author: "Evan Stokdyk")
#set text(16pt)

#let multiset(x, y) = $(binom(#x, #y))$

= Question 1
#find[
  The number of different necklaces that can be made from $n$ pairs of beads. The
  pairs have the same color but different shape. No identically colored beads
  can be placed side by side. A necklace can rotate or flip and remain identical.
]

AI:
$
  1/2 sum_(k=0)^n (-1)^k C(n, k) (2n - k - 1)! 2^k
$

#h(1fr) $ballot$

= Question 2
#find[
  How many ways are there to give out hats such that no person gets their own
  hat? This is equivlent to some derangement. Take the limit of that
  polynomial.
]

TODO

#find[
  How many ways can the hats be passsed out such that the first $i$ people get
  the right hat?
]

TODO

#find[
  Using the previous answer, how many ways can hats be passed back so that
  exactly $i$ people get the right hat?
]

TODO

= Question 3.1-12
#find[
  TODO
]

TODO
