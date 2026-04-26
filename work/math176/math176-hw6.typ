#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "MATH176 - Homework 6", columns: 1, author: "Evan Stokdyk")
#set text(16pt)

#let multiset(x, y) = $(binom(#x, #y))$

= Question 2.2-1
#find[The expansion of $(2x - 3)^4$.]

$
  binom(4, 0) (2x)^4 (-3)^0 &+ binom(4, 1) (2x)^3 (-3)^1 + binom(4, 2) (2x)^2 (-3)^2 \
  &+ binom(4, 3) (2x)^1 (-3)^3 + binom(4, 4) (2x)^0 (-3)^4
$

#h(1fr) $ballot$

= Question 2.2-2
#find[
  The coefficient of $x^5$ in $(6x + 1/2)^7$.
]

$
  binom(7, 5) (6x)^5 (1/2)^2 \
  6^5 binom(7, 5) (1/2)^2 x^5
$

#h(1fr) $ballot$

= Question 2.2-3
#prove[
  $sum_(i=0)^n binom(n, i)^2 = binom(2n, n)$.
]

First, we can use an identity of the binomial operation to expand as follows:
$
  sum_(i=0)^n binom(n, i)^2 = sum_(i=0)^n binom(n, i) binom(n, n-i)
$

What this is counting is selecting some number of elements from one half of a
larger set and then the rest from the other half. The sum counts all possible
permutations of the number you can select from each side. In each case, $n$
elements are selected.


This is identical from selecting a general $n$ elements from the combined set
made up from the two halves ($2n$), or:

$ sum_(i=0)^n binom(n, i)^2 = binom(2n, n) $

#h(1fr) $ballot$

= Question 2.2-4
#find[
  Write down the expansion using the binomial theorem of $(x+1)^n$. What can you
  conclude about:
  $
    binom(n, 0) - binom(n, 1) + binom(n, 2) - dots plus.minus binom(n, n)
  $
  if $n in ZZ^+$.
]

For simplicity, I will instead expand the identical $(1+x)^n$:
$ binom(n, 0) x^0 1^n + binom(n, 1) x^1 1^(n-1) + dots + binom(n, n) x^n 1^0 $

Observe that when $x=-1$ the equation simplifies as follows:
$
  (1 + -1)^n &= binom(n, 0) (-1)^0 1^n + binom(n, 1) (-1)^1 1^(n-1) + dots + binom(n, n) (-1)^n 1^0 \
  0 &= binom(n, 0) - binom(n, 1) + dots plus.minus binom(n, n) 
$

#h(1fr) $ballot$

= Question 2.2-5
#prove[
  The number of distributions for $k$ identical objects to $n$ distinct
  recipients so that each gets at least one is $multiset(n, k-n)$. Prove that
  this equals $binom(k-1, n-1)$.
]

To prove this, we need to show that they count the same idea.

First, we can assign one item to each of the $n$ recipients and then
multi-choose from the remaining $k-n$ elements. As such the value can be
counted as: $multiset(n, k-n)$.

This can also be counted by looking at the total items and have the recipients
be used as partitions of those items. Visually this can be seen as having the
items be dots and placing dividers between them to create partitions of
identical items. If each person has at least one item the that means that no
person as no items. To restrict that we can place restrictions on where the
dividers can be placed, specifically: none at the end ($k-1$ options) and
non-overlapping (regular selection). The number of dividers placed is $n-1$ as
that is what is needed to create $n$ partitions. Combining these facts gives the
equation: $binom(k-1, n-1)$.

These values count the same number so they must be equal.

$ multiset(n, k-n) = binom(k-1, n-1) $

#h(1fr) $ballot$
