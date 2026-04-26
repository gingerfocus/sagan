#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "MATH178 - W25 - Homework 4", columns: 1, author: "Evan Stokdyk")

#set text(16pt)
#show table: it => align(center)[#it]

= Problem 1 A

#table(
    columns: 2,
    [0101], [0001],
    [0011], [1011],
)

This can be solved by consulting the table in the Handout: S-AES S-Box by
changing each value with its coresponding value in the lookup table.

#table(
    columns: 2,
    [0001], [0100],
    [1011], [0011],
)

DONE

= Problem 1 B

This process can be inverted by using the output nibble as the index and
subsituting with the coresponding input nibble.

#table(
    columns: 2,
    [0111], [0101],
    [1011], [0011],
)

DONE

= Problem 2

#align(center)[$(0100)_2 = x^2 $]

find inverse of above

convert it to the y feild

do the calculation

show it equals:

#align(center)[$(1101)_2 = x^3 + x^2 + 1 $]

= Problem 3

The key $10011100 11000011_2$ can be expanded as such:

$
    W[0] &= 1001 \
    W[1] &= 1100 \
    W[2] &= 1100 \
    W[3] &= 0011 \
$

Now the round constants thing:

$
    R[0] &= \
    R[1] &= \
$

Now we can build the next round constant:

$
    R[2] &= \
    R[3] &= \
$


Then the next keys can be created as follows

$
    W[4] &= W[4-2] xor R[4/2] xor "Sbox"(W[4-1]) \
         &= 1100 xor x x x x xor "Sbox"(0011) \
         &= x x x x \
    W[5] &= W[5-2] xor W[5-1] \
    W[6] &= W[6-2] xor R[6/2] xor "Sbox"(W[6-1]) \
    W[7] &= W[7-2] xor W[7-1] \
$

Again, this can be repeated for the next key.

$
    W[8] &= W[8-2] xor R[8/2] xor "Sbox"(W[8-1]) \
         &= \
    W[9] &= W[9-2] xor W[9-1] \
    W[10] &= W[10-2] xor R[10/2] xor "Sbox"(W[10-1]) \
    W[11] &= W[11-2] xor W[11-1] \
    R[2] &= \
    R[3] &= \
$

= Problem 4

Is there anything better that guess and check??

TODO

= Problem 5

#table(
    columns: 8,
    table.header([], [$1$], [$x$], [$x+1$], [$x^2$], [$x^2+1$], [$x^2+x$], [$x^2+x+1$]),
    [$1$], [], [], [], [], [], [], [],
    [$x$], [], [], [], [], [], [], [],
    [$x+1$], [], [], [], [], [], [], [],
    [$x^2$], [], [], [], [], [], [], [],
    [$x^2+1$], [], [], [], [], [], [], [],
    [$x^2+x$], [], [], [], [], [], [], [],
    [$x^2+x+1$], [], [], [], [], [], [], [],
)

TODO

= Problem 6

TODO

= Sources
None
