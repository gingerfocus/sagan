#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "MATH190 - Homework 4", columns: 1, author: "Evan Stokdyk")
#show math.equation: set block(breakable: true)
#show link: underline
// #set text(16pt)

= Problem 1
No solution found.
#find[
  Find the probability that after breaking a stick in 2 points it is able to
  form a triangle?
]

Without loss of generality, assume that you have chosen the first point to
break in the first half by symmetry. Then, if the second point you choose is on
the same half then there will be a piece that is greater than $1/2$ which means
that the other two pieces cannot form a non-degenerate triangle. Thus the
probability is $1/2$.

#h(1fr) $ballot$

= Problem 2
No solution found.

= Problem 3
No solution found.

= Problem 4
#prove[
  Any rational number $a/b$ can be represented as:
  $ a/b = 1/n_1 + 1/n_2 + 1/n_2 + ... + 1/n_k $
]

Given a number $a/b$ we can rewrite it as:
$
  a/b = a (1/b) = 1/b + 1/b + ... + 1/b \
$

These terms are not unique, but one of them can be kept and the rest can be
expanded as such:
$
  a/b = a (1/b) = 1/b + (a-1)(1/(2b) + 1/(3b) + 1/(6b))
$

This process of expanding can be done indefinatly. There will be repeats as 6
is factored as $3 dot 2$ but these can just be continually expanded as there
are infinite natural numbers.

#h(1fr) $ballot$

= Problem 5
No solution found.

= Reading Summary
== Problem 137
#prove[$
  1/(log_2 (N)) + 1/(log_3 (N)) + 1/(log_4 (N)) + ... + 1/(log_100 (N)) = 1/log_(100!) (N) \
$]

We can invert the logs using a log rule and then combine them through
multiplication:
$
  log_N (2) + log_N (3) + log_N (4) + ... + log_N (100) eq.quest log_N (100!)
  log_N(2 dot 3 dot 4 dot ... dot 100) eq.quest log_N(100!)
$

#h(1fr) $ballot$

== Solution
The books solution is almost identical but is easier to follow. The solution
first starts by introducing the log rule that will be used which is more
intuitive. It then similarly combines them into one step which makes the
solution much more brief but leaves the conclusion off the page. I think this
teaches me about my own proof writing that a proof should focus mostly on the
"trick" used and skip over most of the boring arithmetic.

== Understanding
The book states a short explanation of the log rule but I think it is still
worthwhile to restate it:
$
  log_a(b) &= x \
  b &= a^x \
  b^(1/x) &= a \
  log_b(b^(1/x)) &= log_b(a) \
  1/x log_b(b) &= log_b(a) \
  log_b(a) &= 1/x \
$

I also found value in looking over solutions to 145 and 146 as both seemed very
solvable to me somehow using the identity of $e$ but the solution is much
better. I found that creating a bound was not what I expected.

= Sources
Talked with a friend on question 2 & 4 for 3 hours.
