#import "@local/pset:0.1.0" as pset: prove
#show: pset.ieee.with(title: "MATH176 - Homework 1", columns: 1, author: "Evan Stokdyk")

#set text(16pt)

= Question 1
#prove[
  $ sum_(i=1)^n i = binom(2, n+1)$ 
]

// n(n + 1)/2
The base case is n = 1. Which is just:
$
  sum_(i=1)^1 i &= binom(2, 1) = 1 \
  1 &= 1
$

By induction, we can write the hypothesis as:

$ sum_(i=1)^n i = n(n + 1)/2 $

Now we can add n+1 to both sides to get:

$
  sum_(i=1)^(n) i + (n+1) &= n(n + 1)/2 + (n+1) \
  sum_(i=1)^(n+1) i &= (n(n + 1) + 2(n + 1))/2 \
  sum_(i=1)^(n+1) i &= ((n + 2)(n + 1))/2 \
$

#h(1fr) $ballot$

= Question 2
#prove[The set $[n] = {1, 2, . . . , n}$ has $2^n$ subsets]

The base case is n = 1. Which is just:
$
  [1] &= {1} \
  P([1]) &= {emptyset, {1}} \
  hash P([0]) &= 2 \
  2 &= 2^1
$

The induction step is n + 1. Which that given:
$ hash P([n]) = 2^n $

Each possible set can have a new unique set created by adding the $n "+1" dash "element"$ to
it. So the count is added to itself:

$
  hash P([n + 1]) &= 2^n + 2^n \
  hash P([n + 1]) &= 2^(n+1)
$

#h(1fr) $ballot$

= Question 3
#prove[Given $n in ZZ^+$. The number of ordered lists of ${1, 2, . . . , n}$ is $n !$]

The base case is n=1. Which is just:
$
  "Runs"(1) &= {1} \
  hash "Runs"(1) &= 1 \
$

Given that: $ hash "Runs"(n) = n $

To find the new list creatable using the old list the new element can be
asserted in any valid position within the list. That is the number of
positions in the list plus 1. Therefore we must multiply the number of
lists by that:

$
  hash "Runs"(n+1) &= hash "Runs"(n) dot (n + 1) \
  hash "Runs"(n+1) &= n! dot (n + 1) \
  hash "Runs"(n+1) &= (n+1)!
$

#h(1fr) $ballot$

= Question 4
#prove[
  Given $n gt.eq 1$ and S is an $(n + 1) dash "element"$ subset of $[2n]$.
  There exist two numbers in S whose sum is 2n + 1
]

We can construct groups from which the sets must select from. Numbers are
groued with the complement number that adds to 2n+1.
$
  g(S) = { (1, 2n), (2, 2n-1), dots , (n, n+1) }
$

There are n of these groups and the subset must select $n+1$ times from
this group and thus by the pigeonhole principal it must select 2 from one
group. Therefore there will by two elements in S that sum to 2n + 1.

= Question 5
#prove[
 Consider any 5 points with integer coordinates on the x − y plane.
  There are two points such that the midpoint of the line segment joining
  them also has integer coordinates.
]

The midpoint of the line segment joining two points is:

$
  "midpoint" (x_1, y_1, x_2, y_2) = (x_1 + x_2)/2, (y_1 + y_2)/2
$

For the midpoint to have integer coordinates, the sum of the coordinates
must be even. This can be broken up into two reductions using the two points.
The first reduction is to construct pairs of points where the coridantes:
$ 2 | x_1 + x_2 $

There are two groups so that means there must be at least one group with 3
points. The second reduction is we construct pairs of points where the
coridantes:
$ 2 | y_1 + y_2 $

This yet again gives two groups which means there must be one with 2 items in
it which is the pair of points that satisfy the condition.

#h(1fr) $ballot$

































