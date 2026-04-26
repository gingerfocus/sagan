#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "MATH190 - Homework 3", columns: 1, author: "Evan Stokdyk")
#show math.equation: set block(breakable: true)
#show link: underline
// #set text(16pt)

= Problem 1
No solution found.

= Problem 2
#prove[
  Given $n$ red nodes and $n$ blue nodes, prove there exists a way to connect
  the nodes with no crossings.
]

Define a net as set of connect of these nodes. The size of the net is the sum
of the length of the lines in this net. The set of nets is non-empty so there
must exists (at least) one net with the smallest size.

For sake of contradiction, assume there is a smallest net with a crossing.

Consider the 4 nodes that define the lines of the crossing in this net. By
connecting all 4 of these nodes you create a parallelogram from this.
Considering only the size of the net made by these two connection, the current
size is the sum of the diagonal line segments. The second option is either pair
of edges around the parallelogram (based on how the nodes are colored). Without
loss of generality, for each of the four triangles that defines the
parallelogram, a line across the diagonal constitutes the edges of two of them
and the sides only constitutes one.

One sides of a triangle will always be less than the sides of the other two. As
such by changing the selection for how to connect these nodes you creates a net
that is smaller locally which means the net is overall smaller.

Thus, given a net with a intersection it is always possible to construct a
smaller net so by contradiction the smallest graph cannot contain an
intersection.

As a result, there exists a net with no intersections.

#h(1fr) $ballot$

= Problem 3
#find[
  Given:
  $
    x + y + z &= 1 \
    x^2 + y^2 + z^2 &= 2 \
    x^3 + y^3 + z^3 &= 3
  $
  Find, $x^4 + y^4 + z^4$.
]

Using #link("https://en.wikipedia.org/wiki/Newton's_identities")[Netwon's
identities], to find the value we need to find $p_4$ which is done by plugging
in values:
$
  p_4 &= e_1 p_3 - e_2 p_2 + e_3 p_1 - 4 e_4 \
  p_4 &= 3(e_1) - 2(e_2) + 1(e_3) - 4(0) \
  p_4 &= 3(p_1) - 2(1/2(p_1^2 - p_2)) + 1/3(1/2 p_1^3 - 3/2 p_1 p_2 + p_3) \
  p_4 &= 3(1) - (1^2 - 2) + (1/6 1^3 - 1/2 (1)(2) + 1/3 (3)) \
  p_4 &= 3 - 1 + 2 + 1/6 - 1 + 1 \
  p_4 &= 4 + 1/6 \
  p_4 &= 25/6 \
  x^4 + y^4 + z^4 &= 25/6
$

#h(1fr) $ballot$

= Problem 4
No solution found.

= Problem 5
#prove[
  Given $lim_(n -> oo) (a_(n+1) - a_n) = L$ then $lim_(n -> oo) a_n = L/n$.
]

By the definition of the limit, given any $epsilon > 0$, there is value $k$
such that:
$
  L - epsilon &lt.eq a_(k+1) - a_k &lt.eq L + epsilon \
  L - epsilon + a_k &lt.eq a_(k+1) &lt.eq L + epsilon + a_k
$

Then,
$
  a_n &lt.eq L + epsilon + a_(n-1) \
  a_n &lt.eq 2(L + epsilon) + a_(n-2) \
  a_n &lt.eq (n-k)(L + epsilon) + a_k \
  (a_n - a_k)/(n-k) &lt.eq L + epsilon \
  ( a_n - a_k )/(n-k) - epsilon &lt.eq L
$

In the limit, we can make $n$ arbitrarily large and $epsilon$ arbitrarily small
thus:
$
  lim_(n -> oo) L - 2 epsilon lt.eq ( a_n - a_k )/(n-k) - epsilon &< L
  lim_(n -> oo) a_n/n = L
$

#h(1fr) $ballot$

= Reading Summary
== Problem 125
#find[
  Given that there are 2 seventh graders in a chess tournament where everyone
  plays everyone else, how many other participants that all score the same
  amount of points must there be if the 2 seventh graders score a combined 8
  points. Matches give one point for a win and $1/2$ each for a tie.
]

Each score the same amount of points is the harder condition to fulfill. Like
induction, first assume that each eighth grader scores the same amount of
points among themselves, if they tie all games this is trivially true. Now,
when you add the two seventh graders you must preserve this stability. One way
to do this is to have each eighth grader have the same match result with each
seventh grader.

The simplest possible version of this is that they tie all games. This means
that each seventh grader would score 4 points from 8 games. This means there
must be 9 total players or 7 eighth graders.

#h(1fr) $ballot$

== Solution

== Understanding
My solutions is bad beacause it does the minimal effort to find one solution. I
like the book solution more than mine but I think it is overly verbose. 

It would have been worthwhile to try to find all solutions and after reading
the book solution, I see how I could modify my own to get the second answer. My
stratgy of doing a very bad version of induction is interesting and I want to
see where else I could apply that as it seems to be graphs.

= Sources
Talked to Claire about question 3. The wikipedia article linked in question 3.
