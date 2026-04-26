#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "ELEN152 - Homework 1", columns: 1, author: "Evan Stokdyk")
// #show link: set text(fill: blue)
// #import "@preview/lilaq:0.6.0" as lq
// #set text(16pt)


= Problem 3.10
#find[
  In the CZ process, the maximum pull rate for 150mm diameter wafer is about
  $24"cm" h^(-1)$. How long will it take to pull a 300mm diameter ingot that is
  3m long.
]

Equation 3.12 in the textbook shows that:
$ v_"PMAX" prop sqrt(1/r) $

Doubling the diameter also doubles the radius and scales according to the above
relationship:
$
  v_"PMAX"' &= v_"PMAX" dot sqrt(1/(Delta r)) \
  v_"PMAX"' &= 24 dot sqrt(1/2) \
  v_"PMAX"' &= 16.97
$

Thus the total time taken is:
$
  (300"cm")/(16.97"cm" h^(-1)) = 17.67 h
$

#h(1fr) $ballot$

= Problem 3.12
#find[
  A CZ crystal is pulled from a melt of $5 times 10^16 "cm"^(-3)$ boron and $5
  times 10^16 "cm"^(-3)$ arsenic. What is the initial doping and when does it
  change type.
]

The separation constants for boron is 0.8 and for arsenic it is 0.3. So at
$t=0$ it can be modeled using equation 3.22:
$
  C_S &= C_0 k_0 (1 - f)^(k_0 - 1) \
  C_S &= C_0 k_0 (1 - 0)^(k_0 - 1) \
  C_S &= C_0 k_0 \
$

The concentration of each is the same so there will be more boron doping at the
start as $0.8 > 0.3$. This means the crystal will be (P) type.

To find when the doping changes we need to find what value of f causes:
$
  C_0 k_"0, As" (1 - f)^(k_"0, As" - 1) &> C_0 k_"0, B" (1 - f)^(k_"0, B" - 1) \
  k_"0, As" (1 - f)^(k_"0, As" - 1) &> k_"0, B" (1 - f)^(k_"0, B" - 1) \
  0.3 (1 - f)^(0.3 - 1) &> 0.8 (1 - f)^(0.8 - 1) \
  0.3 (1 - f)^(-0.7) &> 0.8 (1 - f)^(-0.2) \
  0.3/0.8 &> (1 - f)^(-0.2 + 0.7) \
  0.375 &> (1 - f)^(0.5) \
  0.375^2 &> 1 - f \
  f &> 1 - 0.375^2 \
  f &> 0.8594
$

So the doping will change type at $f = 0.85938$. The crystal will then become
(N) type.

#h(1fr) $ballot$

= Problem 3.13
#find[
  A melt starts with a Sb concentration of $1 times 10^16 "cm"^(-3)$. After 80%
  of the melt is used, silicon is added to return to its original volume. What
  is the concentration of Sb after 50% of the melt has been used. $k_0 = 0.02$.
]

Using equation 3.22 we can write:
$
  C_S &= C_0 k_0 (1 - f)^(k_0 - 1) \
  C_S &= 10^16 dot 0.02 (1 - 0.8)^(0.02 - 1) \
  C_S &= 2 dot 10^14 (0.2)^(-0.98) \
  C_S &= 9.68324 dot 10^14 med "cm"^(-3)
$

This gives the concentration in the solid crystal and the find the remaining
concentration in the melt we apply the definition of $k_0$:
$
  C_S &= k_0 C_L \
  C_L &= C_S / k_0 \
  C_L &= 9.68324 dot 10^14 1/0.02 \
  C_L &= 4.84162 dot 10^16 med "cm"^(-3)
$

This is diluted by 5 times to refill the melt with pure silicon: 
$
  C_L &= 4.84162 dot 10^16 1/5 \
  C_L &= 9.68324 dot 10^15 \
$

Again, we can do the calculations for another pull to find:
$
  C_S &= C_0 k_0 (1 - f)^(k_0 - 1) \
  C_S &= 9.68324 dot 10^15 dot 0.02 (1 - 0.5)^(0.02 - 1) \
  C_S &= 3.81997 dot 10^14 "cm"^(-3)
$

#h(1fr) $ballot$

= Problem 3.16
#find[
  If you want to have an Au contaminations less that $10^10 "cm"^(-3)$ and use
  99% of the melt. What is the upper bound on Au contamination in the
  polycrystalline silicon?
]

Again, using equation 3.22 we can write:
$
  C_S &= C_0 k_0 (1 - f)^(k_0 - 1) \
  10^10 &= C_0 dot 2.5 dot 10^(-5) (1 - 0.99)^(2.5 dot 10^(-5) - 1) \
  4 dot 10^4 dot 10^10 &= C_0 (0.01)^(2.5 dot 10^(-5) - 1) \
  C_0 &= 4 dot 10^14 (0.01)^(1 - 2.5 dot 10^(-5)) \
  C_0 &= 4.00046 dot 10^12 med "cm"^(-3)
$

#find[
  Suppose you only have access to polycrystalline that has 10 times more Au
  than above. What can you do?
]

TODO

Add more as you pull.

OR

Stop the pull early.

= Game
Here is the completion of level 3:
#align(center)[#image("complete.png", width: 60%)]

I also worked through level 4 which required that I do multiple wet etches to
build this cantilever structure. I wonder if repeating a process like this is
done in fabs.
#align(center)[#image("cantilever.png", width: 60%)]

