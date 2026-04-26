#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "MATH176 - Homework 4", columns: 1, author: "Evan Stokdyk")
#set text(16pt)

= Question 1.4-6
#prove[
  Let $f: A --> B$. Prove that $equiv$ on A given by $a_1 equiv a_2$ iff
  $f(a_1) = f(a_2)$ is an equivalence relation and show its equivalence
  classes.
]

To show that this is an equivalence relation it needs to be:

=== reflexive
Given a value $a$ then $f(a) = f(a)$ so $a equiv a$.

=== symmetric
Given values $a$ and $b$, $f(a) = f(b) = f(a)$ so $a equiv b equiv a$.

=== transitive
Given values $a$, $b$ and $c$, if $f(a) = f(c)$ and $f(b) = f(c)$ then $a equiv
c$ and $b equiv c$. But then $f(a) = f(c) = f(b)$ so $a equiv b$.

Thus this is a equivalence relation. Its equivalence classes are the numbers
that map to the same value. This is often done when finding the roots of a
function as we have and equivalence class for $f(x) = 0$ and we find all the
elements in that set. Thus, the set $B$ can be partitioned as such:
$ { b in B : { a in A : f(a) = b } } $

#h(1fr) $ballot$

= Question 1.4-8
#find[
  How many ways are there to seat 5 woman and 5 men around a circular table
  given that they alternate.
]

We first over count by placing the people in any given seat by gender:
$ 5! dot 5! $

Note that this number makes a distinction that we have gendered chairs which
implies that the first chair contains a specific gender. As such this
misses 5 rotation which are equivalence classes created by rotating by two
chairs. Reducing the count as such gives:
$ 5! dot 5! / 5 $

#h(1fr) $ballot$

= Question 1.4-9
#find[
  How many ways can we arrange 10 chairs of 9 different colors around a
  circular table.
]

We can create an over count by first choosing the location of the two identical
chairs then place the remaining 8 chairs in any arrangement:
$ binom(10, 2) dot 8! $

This count is rotation invariant given the 10 rotations:
$ binom(10, 2) dot 8! / 10 $

#h(1fr) $ballot$

= Question 1.4-10
#find[
  The ways to split 10 people into 2 groups of size 3 and one group of size 4.
]

We can create an over count by just creating an ordered list of the 10 people
$10!$. Then, we have a permutational symmetry for each of groups within
themselves:

$ 10! / (3! dot 3! dot 4!) $

The two groups of 3 can also have permutational symmetry the final number of
arrangements is:
$ 10! / (3! dot 3! dot 4! dot 2!)  $

#h(1fr) $ballot$

= Question 1.4-15
#find[
  How many different necklaces can we make from $n$ beads of different colors.
]

The over count of necklaces is $n!$. To account for both rotating and flipping
the necklaces we can separate out each step:

$ n! / (n dot 2) $

#h(1fr) $ballot$
