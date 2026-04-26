#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "MATH176 - Homework 2", columns: 1, author: "Evan Stokdyk")
#set text(16pt)

= Question 1 B
#find[
  The number of ways to pick five unique numbers from 1 to 25.
]

The order does not matter so this is a combination problem: $binom(25, 5)$.

#h(1fr) $ballot$

= Question 1 C
#find[
  The number of ways to pick four number from 1 to 18 where order matters.
]

This question instead is order less so this is a permutation problem: $(18)_4$.

#h(1fr) $ballot$

= Question 4
#find[
  How many 10 digit hexidecimal numbers begin and end with an F.
]

We can write this using the product combination formula seeing that for the
first digit we have no choices:
$
  1 dot 16^(10-2) dot 1 = 16^8
$

#find[
  How many 8 digit octal numbers begin and end with an even digit.
]

Again, we have limited choices for the first digit so we can use the product
combination formula:
$
  4 dot 8^(8-2) dot 4 = 4^2 dot 8^6 = 4^11
$

#h(1fr) $ballot$

= Question 6
#find[
  The number of ways to win a match 4 in a pick 6 lottery with 40 numbers.
]

There are 4 ways to permute the matching numbers within the 6 spots and 40
possible numbers that can used. The remaining number can be any of the 39
others:
$ 40 dot binom(6, 4) dot 39 dot 39 $

#h(1fr) $ballot$

= Question 8
#find[
  How many alphabetic words can be made from the phone number 289-3447.
]

The numbers have the following choices:
$ 3 dot 3 dot 4 dot 3 dot (3 + 2 + 1) dot 4 $

Each number has the coresponding numbers to choose from and the two 4s can be
split into cases where one must be equal or after the other alphabetically.

If you are allowed to leave the number as is this adds a case for each:
$ 4 dot 4 dot 5 dot 4 dot (3 + 2 + 1 + 4) dot 5 $

#h(1fr) $ballot$

= Question 9
#find[
  The number of subsets of $[20]$ that have smallest element 4 and largest
  element 15.
]

There are two values which are forced and the rest can be chosen independently
from the remaining 12 possibilities. Each of these can either be included or
not meaning there are:
$
  1 dot 2^(12) dot 1 = 2^12
$

#find[
  The number of subsets of $[20]$ that contain no even numbers.
]

There are $10$ values in $[20]$ that are even and each can either be
included or not. Thus there are $2^10$ possibilities.

#find[
  The number of subsets of $[20]$ that have size 10 and dont contain any number
  larger than 17.
]

This the the same as selecting 10 from $[17]$ thus it is $binom(17,10)$.

#h(1fr) $ballot$

= Question 11
#find[
  The number of of results from an acending order result of tossing 5
  six sided dies.
]

Placing it in acending order is the same as saying that order does not matter
as you can reorder the elements. As such we can write it as such:

$
  (binom(6, 5))
$

#find[The number where all are even]

Yet again order does not matter and repititon is allow so we now select from
the reduced possibilities

$
  (binom(3, 5))
$

#h(1fr) $ballot$

= Question 13
#find[
  How many 6 item permutations on $[15]$ have their digits in increasing order.
]

Given the total sets of $(15)_6$ only one of the permutations is arranged in
acending order. In other words, 1 in $binom(15, 6)$ are valid:
$ (15)_6 / binom(15,6) = 6! $

#h(1fr) $ballot$

= Question 19
#find[
  How many rectangles are inscribed within a 4x7 checkerboard.
]

We can imagine choosing the four corners order does not matter for each but
they multiply.

$
  binom(4, 2) dot binom(7, 2)
$

#h(1fr) $ballot$
