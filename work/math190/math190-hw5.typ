#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "MATH190 - Homework 4", columns: 1, author: "Evan Stokdyk")
#show math.equation: set block(breakable: true)
#show link: underline
// #set text(16pt)


= Problem 1
No solution found.

= Problem 2
#prove[
  Given an sequence $a_1, a_2, a_3, ... , a_n$ of distinct positive integers.
  Show that:
  $ sum_(k=1)^n a_k/k^2 gt.eq sum_(k=1)^n 1/k $.
]

The sequence that produces the minimal value for the right hand side will be
the sequence of value from 1 through n. This the sequence $a_1, a_2, a_3, ... ,
a_n$ will result in a value greater than or equal to permutations of $[n]$.

Next, the minimal value on the right hand side is when the sequence is sorted
in reverse order. The value of $1/k^2$ is maximal for small values of k. By the
rearrangement inequality, the minimal value of the sum will be created when the
smallest value will be placed at the start:
$ sum_(k=1)^n a_k/k^2 gt.eq sum_(k=1)^n k/k^2 $.

This can be simplified as such:
$ sum_(k=1)^n a_k/k^2 gt.eq sum_(k=1)^n 1/k $.

#h(1fr) $ballot$

= Problem 3
#prove[
  There exists $10^9$ consecutive numbers that are all perfect cubes.
]

Pick some sequence of $10^9$ distinct positive integers ${b_1, b_2, ... b_(10^9)}$

Then, construct the congruence relations of:
$
  0 &equiv n   (mod b_0^3) \
  0 &equiv n+1 (mod b_1^3) \
  0 &equiv n+2 (mod b_2^3) \
  0 &equiv n+3 (mod b_3^3) \
  dots.v &equiv dots.v \
  0 &equiv n+10^9 (mod b_(10^9)^3) \
$

You can then create:
$
  n &equiv 0  (mod b_0^3) \
  n &equiv -1 (mod b_1^3) \
  n &equiv -2 (mod b_2^3) \
  n &equiv -3 (mod b_3^3) \
  n &equiv dots.v \
  n &equiv -10^9 (mod b_(10^9)^3) \
$

This yields $10^9$ distinct congruences for n. By the Chinese remainder
theorem, n must exists.

#h(1fr) $ballot$

= Problem 4
#find[
  The probability of selecting two points from a ball in $RR^3$ such that they
  are distance less than 1 away.
]

UNFINISHED

The first point selected on the sphere can be said to be distance r from the
center. This problem is symmetric in all ways due to being from a sphere so this
is the only relevant value. Then, centered on that point, it is possible to
construct a sphere of radius on that is centered on that point.

To do this I will integrate over the distance of each possible point
chosen and find the area of the intersections over the total possible
area:
$
  &integral_0^1 (Delta A)/ A dif r \
  &integral_0^1 1/(4/3 pi r^3) 2 integral_(1-r/2)^1 pi sqrt(1 - rho^2)^2 dif rho dif r \
  &2 pi integral_0^1 1/(4/3 pi r^3) integral_(1-r/2)^1 1 - rho^2 dif rho dif r \
  &2 pi integral_0^1 1/(4/3 pi r^3) [ rho - 1/3 rho^3 |_(1-r/2)^1 dif r \
  &2 pi integral_0^1 1/(4/3 pi r^3) [ 1 - 1/3 1^3 - (1-r/2) + 1/3 (1-r/2)^3 ] dif r \
  &2 pi integral_0^1 1/(4/3 pi r^3) [ 2/3 - 1 + r/2 + 1/3 (1-r/2)^3 ] dif r \
  &2 pi integral_0^1 1/(4/3 pi r^3) [ -1/3 + r/2 + 1/3 [ 1 - 3 r/2 + 3 r^2/4 - r^3/8 ] ] dif r \
  &2 pi integral_0^1 1/(4/3 pi r^3) [ -1/3 + r/2 + 1/3 - r/2 + r^2/4 - r^3/24 ] dif r \
  &2 pi integral_0^1 1/(4/3 pi r^3) [ r^2/4 - r^3/24 ] dif r \
  &2 integral_0^1 3/(4 r^3) [ r^2/4 - r^3/24 ] dif r \
  &3/2 integral_0^1 1/(4 r) - 1/24 dif r \
  &3/2 [ 1/4 ln r - 1/24 r ]_0^1
$

So this is the intersection of the spheres across all the radius points.
We can divide this by the 

5/16

...

No solution found.

= Problem 5
No solution found.

= Reading Summary
== Problem 177
#find[
  How many roots does the following equation have:
  $ sin x = x / 100 $.
]

The statement can be rewritten as:
$
  x = 100 sin x
$

The value of sin will be bounded from 0 to 1 so it can never exceed 100
or -100. Therefore, we only need to look at how many times the function
will intersect on [-100, 100].

Sin is periodic and it will undergo ($100 / (2 pi) = 15.9$) 15 full cycles from
0 to 100. As such for each of these it will intersect 2 times. In addition, the
remaining cycle represents more than the cycle so it will also intersect 2 more
times. So there are $15 dot 2 + 2 = 32$ intersections.

Including the other side and the point at zero there are $32 dot 2 + 1 = 65$
intersections.

#h(1fr) $ballot$

== Solution
The solution in the book also identifies the symmetry over the y axis. It then
has much better wording for the cycles. It also explains both visually and
mathematically why there are 2 intersection in the partial cycle.

I also forgot that including the point at zero must also exclude that point
from the first cycle.

== Understanding
If I could do this again, I would try to do use the intermediate value theorem
for each interval. This is what I intuitively understand but fail to fully
explain in my argument.

= Sources
Talked with Claire Monday evening.
