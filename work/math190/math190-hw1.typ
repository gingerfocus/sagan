#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "MATH190 - Homework 1", columns: 1, author: "Evan Stokdyk")
// #set text(16pt)

#show math.equation: set block(breakable: true)

= Problem 1
#prove[
  A subset of size $n+1$ of $[2n]$ will have two elements such that one divides
  the other:

  // $ exists S subset [2n] |S| = n+1 and exists x, y in S quad x | y $
]

There are n odd numbers in the set $[2n]$ which will be the basis for the
pigeonholes. Every other number will be placed in the same group as n/2. The
only way this can not be an integer is if it is odd which would mean it could
be place in a bucket. In other words you can make buckets that look like:

$ { k, 2 k, 2^2 k, 2^3 k dots } $

Some buckets will only contain 1 value but there is at least one with more than
one element so by the pigeon hole principal selecting n+1 items will result in
selecting 2 items from on of the buckets. Any two items in the same bucket must
divide each other.

#h(1fr) $ballot$

= Problem 2
#prove[
  Given the numbers 1 through n show that any ordering of combining them with 
  $a + b + a b$ produces the same final answer.
]

I am not sure exactly how to explain this proof but I belive showing that any
ordering of combining 4 elements is the same should be enough. Addition also 
commutes so the sepecific values are irrelevant.

Define the operation as follows: $s(a, b) = a + b + a b$

The goal is to show that:
$
  s(s(a, b), s(c, d)) =? s(a, s(b, s(c, d)))
$

The right side is as follows:
$
  &s(a + b + a b, c + d + c d) = \
  &a + b + a b + c + d + c d + a c + a d + a c d + b c + b d + b c d + a b c + a b d + a b c d \
  // a + b + c + d + a b + a c + a d + c d + a c d + b c + b d + b c d + a b c + a b d + a b c d \
$

The left side:
$
  &s(a, s(b, c + d + c d)) = \
  &s(a, b + c + d + c d + b c + b d + b c d) = \
  &a + b + c + d + c d + b c + b d + b c d + a b + a c + a d + a c d + a b c + a b d + a b c d \
$

Throguh carefult checking you can see that these terms are identical.

#h(1fr) $ballot$

= Problem 3
#find[
  $ I = integral_0^(pi/2) frac( sin x, sin x + cos x ) dif x $
]

First multiply to get rid of addition in the denominator:
$
  & integral_0^(pi/2) frac(sin x, sin x + cos x ) frac(sin x - cos x, sin x - cos x) dif x \
  & integral_0^(pi/2) frac(sin x (sin x - cos x) , sin^2 x - cos^2 x ) dif x \
  & integral_0^(pi/2) frac(sin^2 x - sin x cos x , -cos 2x ) dif x \
  & integral_0^(pi/2) frac(-sin^2 x, cos 2x) + frac(sin x cos x, cos 2x ) dif x \
  & integral_0^(pi/2) -frac(frac(1-cos 2x, 2), cos 2x) + frac(1/2 sin 2x, cos 2x ) dif x \
  & integral_0^(pi/2) -1/2 sec 2x + 1/2 + 1/2 tan 2x dif x
$

Each of these is a well known integral so it can be solved using a symbolic
integral solver:
$
  integral_0^(pi/2) -1/2 sec 2x + 1/2 + 1/2 tan 2x dif x = pi/4
$

#h(1fr) $ballot$

= Problem 4
No solution found.

= Problem 5
#prove[
  There that by placing the numbers 1 through $n^2$ on a n by n grid there
  will must be two adjacent items that differ by more than n+1.

  // $ // med (n>1) ->
  //   forall n in ZZ & forall G in ZZ^(n times n) (forall i in [n^2] med exists v in G med i = v) -> \
  //     & (exists x_1, x_2, y_1, y_2 in [n] med ( (|x_1 - x_2| <= 1) and (|y_1 - y_2| <= 1) and not (x_1 = x_2 and y_1 = y_2) ) and \
  //     & ( |G[x_1, y_1] - G[x_2, y_2]| >= n+1 )
  // $
]

For sake of contradiction, assume that no element differs by more than n. The
longest path across the grid is the diagonal. By maximality, the smallest and
largest number will need to occupy this path if there is a solution. There are
maximum of (n-1) steps of size n:

$
  1 + (n)(n-1) &gt.eq n^2 \
  n^2 - n + 1  &gt.eq n^2 \
  n &lt.eq 1
$
For values of $n>1$ there can be no such grid and by contradiction there must
be two adjacent squares that differ by $n+1$.

Consider the visual example for $n=3$:

#align(center)[#table(
  columns: 3,
  [1], [#sym.dot], [#sym.dot],
  [#sym.dot], [4], [#sym.dot],
  [#sym.dot], [#sym.dot], [9],
)]

#h(1fr) $ballot$

= Reading Summary

== Problem
#prove[
  57. If each the coefficents to the quadratic equation are odd then the roots
    must be irational.
]

For sake of contradiction, assume that you have an $a$, $b$ and $c$ are odd and
the following is rational:
$
  x = frac(-b plus.minus sqrt(b^2 - 4 a c), 2 a)
$

This is only possible irational component is the square root part so that it
also must be rational. Lets consider it mod 8:

$ b^2 - 4 a c med (mod 8) $

The odd numbers squares mod 8 are 1:
$
  1^2 &= 1 &= 1 med (mod 8) \
  3^2 &= 9 &= 1 med (mod 8) \
  5^2 &= 25 &= 1 med (mod 8) \
  7^2 &= 49 &= 1 med (mod 8) \
$

As such:
$
  b^2 - 4 a c &= 1 (mod 8) \
  1 - 4 a c &= 1 (mod 8) \
  4 a c &= 0 (mod 8) \
$

Then we can say that:
$
  8 | (4 dot a dot c)
$

The numbers a and c are odd so this is a contradiction. Therefore there are no
three odd numbers that produce a rational root.

#h(1fr) $ballot$

== Method
To solve this problem, I used what we talked about in class and in the book to
first look at if the problem can be solved in a ring as this reduces the
amount of possiblities to check.

The first modulo I tried was 4 but did not provide a useful result. Next, I
looked at 16 where I was able to complete the proof but then realized that I
could simplify it using modulo 8.

== Solution

The text book has the same solution that I found. I would likly have not found
this solution if it was not the most recent topic covered in class. I think
this is usefuly as instead of having to consider all possible numbers you can
reduce the possiblity space.

= Sources
Talked through question 1 & 5 on Thursday office hours. Discussed question 3
with 7 people Friday night.


