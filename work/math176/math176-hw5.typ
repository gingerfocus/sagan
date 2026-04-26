#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "MATH176 - Homework 5", columns: 1, author: "Evan Stokdyk")
#set text(16pt)

#let multiset(x, y) = $(binom(#x, #y))$

= Question 2.1-1
#find[
  In how many ways can you distribute 3 distinct pieces of fruit among 5
  children if no child can receive more than 1? If any child can receive any
  number?
]

If no child can receive more than one we use the distinct case: $(5)_3$.

Otherwise, we must instead treat this as random selection: $5^3$.

#h(1fr) $ballot$

= Question 2.1-2
#find[
  The chairperson of a department has to assign advisors to three seniors from
  among ten faculty members in the department. How many different assignments
  are there? How many give no faculty member three advisees? How many give no
  faculty members two or three advisees?
]

The humans are distinct so this is a trivial case of the product rule.
$ 10^3 $

If no one advises 3 seniors, we can just calculate the ways for all to be
advised under one professor and use the sum rule to subtract these away:
$ 10^3 - binom(10, 1) $

Given that no faculty members two or three advisees we could subtract off
another case or just do a direct calculation for this:
$ (10)_3 $

#h(1fr) $ballot$

= Question 2.1-3
#find[
  A candy store stocks 10 different kinds of chocolate. In how many ways can
  someone select a bag of six pieces of candy, each piece of a different kind?
]

This is orderless selection with distinct elements: $binom(10, 6)$.

#h(1fr) $ballot$

= Question 2.1-4
#find[
  In how many ways can 10 identical candy bars be distributed to four children?
]

This is orderless selection of childern with repetition: $multiset(4, 10)$.

#h(1fr) $ballot$

= Question 2.1-5
#find[
  In how many ways can 10 identical candy bars be distributed to four children
  if each child must get at least one candy bar?
]

The bars are identical so we can just simplify the selection to the remaining
unaccounted for bars: $multiset(4, 10-4)$.

#h(1fr) $ballot$

= Question 2.1-6
#find[
  In how many ways can k identical pieces of candy be distributed among n
  children if each child is to get at least j pieces?
]

This is a generic case of the situation above: $multiset(n, k-j n)$. From this
you can observe it adds the condition that $j n lt.eq k$, which is logical as
it just states that you have not preallocated more than you have.

#h(1fr) $ballot$

= Question 2.1-7
#find[
  Ten dice are thrown. The ten dice give a multiset of numbers chosen from ${1,
  2, 3, 4, 5, 6}$. How many different outcomes are there?
]

The answer is embeded in the question: $multiset(6, 10)$.

#h(1fr) $ballot$

= Question 2.1-8
#find[
  In game one, we throw six identical dice and win if we get a one at least
  once. In game two, we throw twelve identical dice and win if we get at least
  two ones. For each game, how many different outcomes lead to a win?
]

A winning permutation will always have a $1$. Then the remaining values can be
anything else: $multiset(6, 6-1)$.

For the second, situation the same logic applies: $multiset(6, 12-2)$.

#h(1fr) $ballot$

= Question 2.1-9
#find[
  In how many ways can 8 distinct flags be placed on 4 distinguishable (really
  tall!) flag poles? What if no pole can be empty? (Note that order matters
  here.)
]

Given full freedom to pick where order matters the value is: $4^8$.

To calculate when no flag poll is empty, without lose of generality the first 4
flags will be chosen to go on each flag. Then the remaining flags can be put on
any pole:
$ (8)_4 dot 4^(8-4) $

#h(1fr) $ballot$
