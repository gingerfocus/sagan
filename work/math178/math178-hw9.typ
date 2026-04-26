#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "MATH178 - W25 - Homework 9", columns: 1, author: "Evan Stokdyk")

#let pom = sym.plus.minus
#show math.equation.where(block: true): set block(breakable: true)

= Problem 1 

To find all the points within a curve, first all the perfect squares of the group will be found. Then, each possible value of x will be plugged in to find a value for $y^2$. This value can be compared to the known square values to see if it falls on the real part of the curve.

Given $E_a: Y^2 = X^3 + 3X + 2 "over" FF_7$:
$
    (pom 0)^2 &= 0 med (mod 7) \
    (pom 1)^2 &= 1 med (mod 7) \
    (pom 2)^2 &= 4 med (mod 7) \
    (pom 3)^2 &= 2 med (mod 7) \
$

Then each value of x can be plugged in:
$
    E_a(0) &= (0)^3 + 3(0) + 2 = 2 med (mod 7) => y = pom 3 \
    E_a(1) &= (1)^3 + 3(1) + 2 = 6 med (mod 7) => y in CC \
    E_a(2) &= (2)^3 + 3(2) + 2 = 2 med (mod 7) => y = pom 3 \
    E_a(3) &= (3)^3 + 3(3) + 2 = 3 med (mod 7) => y in CC \
    E_a(4) &= (4)^3 + 3(4) + 2 = 1 med (mod 7) => y = pom 1 \
    E_a(5) &= (5)^3 + 3(5) + 2 = 2 med (mod 7) => y = pom 3 \
    E_a(6) &= (6)^3 + 3(6) + 2 = 5 med (mod 7) => y in CC \
$

This means we can construct the group as follows:
$
    E_a = { (0, 3), (0, 4), (2, 3), (2, 4), (4, 1), (4, 6), (5, 3), (5, 4), cal(O)  }
$

This process can be repeated for each of the curves (note: I omit the calculations of squares for a feild if it already appears in the document).

Given $E_b: Y^2 = X^3 + 2X + 7 "over" FF_11$:
$
    (pom 0)^2 &= 0 med (mod 11) \
    (pom 1)^2 &= 1 med (mod 11) \
    (pom 2)^2 &= 4 med (mod 11) \
    (pom 3)^2 &= 9 med (mod 11) \
    (pom 4)^2 &= 5 med (mod 11) \
    (pom 5)^2 &= 3 med (mod 11) \
$

Then,
$
    E_b (0) &= (0)^3 + 2(0) + 7 = 7 med (mod 11) => y in CC \
    E_b (1) &= (1)^3 + 2(1) + 7 = 10 med (mod 11) => y in CC \
    E_b (2) &= (2)^3 + 2(2) + 7 = 8 med (mod 11) => y in CC \
    E_b (3) &= (3)^3 + 2(3) + 7 = 7 med (mod 11) => y in CC \
    E_b (4) &= (4)^3 + 2(4) + 7 = 2 med (mod 11) => y in CC \
    E_b (5) &= (5)^3 + 2(5) + 7 = 10 med (mod 11) => y in CC \
    E_b (6) &= (6)^3 + 2(6) + 7 = 4 med (mod 11) => y = pom 2 \
    E_b (7) &= (7)^3 + 2(7) + 7 = 1 med (mod 11) => y = pom 1 \
    E_b (8) &= (8)^3 + 2(8) + 7 = 7 med (mod 11) => y in CC \
    E_b (9) &= (9)^3 + 2(9) + 7 = 6 med (mod 11) => y in CC \
    E_b (10) &= (10)^3 + 2(10) + 7 = 4 med (mod 11) => y = pom 2 \
$

Then,
$
    E_b = {(6, 2), (6, 9), (7, 1), (7, 10), (10, 2), (10, 9), cal(O)}
$

Again $E_c: Y^2 = X^3 + 4X + 5 "over" FF_11$:
$
    E_c (0) &= (0)^3 + 4(0) + 5 = 5 med (mod 11) => y in CC \
    E_c (1) &= (1)^3 + 4(1) + 5 = 10 med (mod 11) => y in CC \
    E_c (2) &= (2)^3 + 4(2) + 5 = 10 med (mod 11) => y in CC \
    E_c (3) &= (3)^3 + 4(3) + 5 = 0 med (mod 11) => y = 0 \
    E_c (4) &= (4)^3 + 4(4) + 5 = 8 med (mod 11) => y in CC \
    E_c (5) &= (5)^3 + 4(5) + 5 = 7 med (mod 11) => y in CC \
    E_c (6) &= (6)^3 + 4(6) + 5 = 3 med (mod 11) => y = pom 5 \
    E_c (7) &= (7)^3 + 4(7) + 5 = 2 med (mod 11) => y in CC \
    E_c (8) &= (8)^3 + 4(8) + 5 = 10 med (mod 11) => y in CC \
    E_c (9) &= (9)^3 + 4(9) + 5 = 0 med (mod 11) => y = 0 \
    E_c (10) &= (10)^3 + 4(10) + 5 = 0 med (mod 11) => y = 0 \
$

Then,
$
    E_c = {(3, 0), (6, 5), (6, 6), (9, 0), (10, 0), cal(O) }
$

Again $E_d: Y^2 = X^3 + 9X + 5 "over" FF_11$:
// for i in $(seq 10); do pcalc "( ($i)^3 + 9 * $i + 5 ) % 11"; done
$
    E_d (0) &= (0)^3 + 9(0) + 5 = 5 med (mod 11) => y = pom 4 \
    E_d (1) &= (1)^3 + 9(1) + 5 = 4 med (mod 11) => y = pom 2 \
    E_d (2) &= (2)^3 + 9(2) + 5 = 9 med (mod 11) => y = pom 3 \
    E_d (3) &= (3)^3 + 9(3) + 5 = 4 med (mod 11) => y = pom 2 \
    E_d (4) &= (4)^3 + 9(4) + 5 = 6 med (mod 11) => y in CC \
    E_d (5) &= (5)^3 + 9(5) + 5 = 10 med (mod 11) => y in CC \
    E_d (6) &= (6)^3 + 9(6) + 5 = 0 med (mod 11) => y = 0 \
    E_d (7) &= (7)^3 + 9(7) + 5 = 4 med (mod 11) => y = pom 2 \
    E_d (8) &= (8)^3 + 9(8) + 5 = 6 med (mod 11) => y in CC \
    E_d (9) &= (9)^3 + 9(9) + 5 = 1 med (mod 11) => y = pom 1 \
    E_d (10) &= (10)^3 + 9(10) + 5 = 6 med (mod 11) => y in CC \
$

Then,
$
    E_d = {(0, 4), (0, 7), (1, 2), (1, 9), (2, 3), (2, 8), (3, 2), (3, 9), (6, 0), (7, 2), (7, 9), (9, 1), (9, 10), cal(O)}
$

For $E_e: Y^2 = X^3 + 9X + 5 "over" FF_13$ we must make new square table:
$
    (pom 0)^2 &= 0 med (mod 13) \
    (pom 1)^2 &= 1 med (mod 13) \
    (pom 2)^2 &= 4 med (mod 13) \
    (pom 3)^2 &= 9 med (mod 13) \
    (pom 4)^2 &= 3 med (mod 13) \
    (pom 5)^2 &= 12 med (mod 13) \
    (pom 6)^2 &= 10 med (mod 13) \
$

// for i in $(seq 12); do pcalc "( ($i)^3 + 9 * $i + 5 ) % 13"; done
Then,
$
    E_e (0) &= (0)^3 + 9(0) + 5 = 5 med (mod 13) => y in CC \
    E_e (1) &= (1)^3 + 9(1) + 5 = 2 med (mod 13) => y in CC \
    E_e (2) &= (2)^3 + 9(2) + 5 = 5 med (mod 13) => y in CC \
    E_e (3) &= (3)^3 + 9(3) + 5 = 7 med (mod 13) => y in CC \
    E_e (4) &= (4)^3 + 9(4) + 5 = 1 med (mod 13) => y = pom 1 \
    E_e (5) &= (5)^3 + 9(5) + 5 = 6 med (mod 13) => y in CC \
    E_e (6) &= (6)^3 + 9(6) + 5 = 2 med (mod 13) => y in CC \
    E_e (7) &= (7)^3 + 9(7) + 5 = 8 med (mod 13) => y in CC \
    E_e (8) &= (8)^3 + 9(8) + 5 = 4 med (mod 13) => y = pom 2 \
    E_e (9) &= (9)^3 + 9(9) + 5 = 9 med (mod 13) => y = pom 3 \
    E_e (10) &= (10)^3 + 9(10) + 5 = 3 med (mod 13) => y = pom 4 \
    E_e (11) &= (11)^3 + 9(11) + 5 = 5 med (mod 13) => y in CC \
    E_e (12) &= (12)^3 + 9(12) + 5 = 8 med (mod 13) => y in CC \
$

Then,
$
    E_e = {(4, 1), (4, 12), (8, 2), (8, 11), (9, 3), (9, 10), (10, 4), (10, 9), cal(O)}
$

#h(1fr) $ballot$

= Problem 2

This process can be done the same as above for $E_e: Y^2 = X^3 + X + 5$ in
different feilds.

In $FF_3$, it is again required to find the squares:
$
    (pom 0) &= 0 med (mod 3) \
    (pom 1) &= 1 med (mod 3) \
$

Then,
$
    E_e (0) &= (0)^3 + (0) + 1 = 1 med (mod 3) => y = pom 1 \
    E_e (1) &= (1)^3 + (1) + 1 = 0 med (mod 3) => y = 0 \
    E_e (2) &= (2)^3 + (2) + 1 = 2 med (mod 3) => y in CC \
$

Thus there are $2 + 1 + 1 = 4$ points. Hasses theorum creates a bound of:
$
    q + 1 - 2 sqrt(q) &lt.eq p &lt.eq q + 1 + 2 sqrt(q)
    3 + 1 - 2 sqrt(3) &lt.eq 4 &lt.eq 3 + 1 + 2 sqrt(3)
    0.53 &lt.eq 4 &lt.eq 7.46
$

To change the modulus we must find new squares and recompute the points. In
$FF_5$:
$
    (pom 0) &= 0 med (mod 5) \
    (pom 1) &= 1 med (mod 5) \
    (pom 2) &= 4 med (mod 5) \
$

Then,
$
    E_e (0) &= (0)^3 + (0) + 1 = 1 med (mod 5) => y = pom 1 \
    E_e (1) &= (1)^3 + (1) + 1 = 3 med (mod 5) => y in CC \
    E_e (2) &= (2)^3 + (2) + 1 = 1 med (mod 5) => y = pom 1 \
    E_e (3) &= (3)^3 + (3) + 1 = 1 med (mod 5) => y = pom 1 \
    E_e (4) &= (4)^4 + (4) + 1 = 4 med (mod 5) => y = pom 2 \
$

Thus there are $4 * 2 + 1 = 9$ points. Hasses theorum creates a bound of:
$
    q + 1 - 2 sqrt(q) &lt.eq p &lt.eq q + 1 + 2 sqrt(q)
    5 + 1 - 2 sqrt(5) &lt.eq 9 &lt.eq 5 + 1 + 2 sqrt(5)
    1.52 &lt.eq 9 &lt.eq 10.47
$

Again in $FF_7$:
$
    (pom 0) &= 0 med (mod 7) \
    (pom 1) &= 1 med (mod 7) \
    (pom 2) &= 4 med (mod 7) \
    (pom 3) &= 2 med (mod 7) \
$

Then,
$
    E_e (0) &= (0)^3 + (0) + 1 = 1 med (mod 7) => y = pom 1 \
    E_e (1) &= (1)^3 + (1) + 1 = 3 med (mod 7) => y in CC \
    E_e (2) &= (2)^3 + (2) + 1 = 4 med (mod 7) => y = pom 2 \
    E_e (3) &= (3)^3 + (3) + 1 = 3 med (mod 7) => y in CC \
    E_e (4) &= (4)^4 + (4) + 1 = 6 med (mod 7) => y in CC \
    E_e (5) &= (5)^5 + (5) + 1 = 5 med (mod 7) => y in CC \
    E_e (6) &= (6)^6 + (6) + 1 = 6 med (mod 7) => y in CC
$

There are $2 * 2 + 1 = 5$ points. The bound is:
$
    q + 1 - 2 sqrt(q) &lt.eq p &lt.eq q + 1 + 2 sqrt(q)
    7 + 1 - 2 sqrt(7) &lt.eq 9 &lt.eq 7 + 1 + 2 sqrt(7)
    2.71 &lt.eq 5 &lt.eq 13.29
$

For $FF_11$:
$
    (pom 0) &= 0 med (mod 11) \
    (pom 1) &= 1 med (mod 11) \
    (pom 2) &= 4 med (mod 11) \
    (pom 3) &= 9 med (mod 11) \
    (pom 4) &= 5 med (mod 11) \
    (pom 5) &= 3 med (mod 11) \
$

Then,
$
    E_e (0) &= (0)^3 + (0) + 1 = 1 med (mod 11) => y = pom 1 \
    E_e (1) &= (1)^3 + (1) + 1 = 3 med (mod 11) => y = pom 5 \
    E_e (2) &= (2)^3 + (2) + 1 = 0 med (mod 11) => y = 0 \
    E_e (3) &= (3)^3 + (3) + 1 = 9 med (mod 11) => y = pom 3 \
    E_e (4) &= (4)^4 + (4) + 1 = 3 med (mod 11) => y = pom 5 \
    E_e (5) &= (5)^5 + (5) + 1 = 10 med (mod 11) => y in CC \
    E_e (6) &= (6)^6 + (6) + 1 = 3 med (mod 11) => y = pom 5 \
    E_e (7) &= (7)^7 + (7) + 1 = 10 med (mod 11) => y in CC \
    E_e (8) &= (8)^8 + (8) + 1 = 4 med (mod 11) => y = pom 2 \
    E_e (9) &= (9)^9 + (9) + 1 = 2 med (mod 11) => y in CC \
    E_e (10) &= (10)^10 + (10) + 1 = 10 med (mod 11) => y in CC
$

There are $6 * 2 + 1 + 1= 14$ points. The bound is:
$
    q + 1 - 2 sqrt(q) &lt.eq p &lt.eq q + 1 + 2 sqrt(q)
    11 + 1 - 2 sqrt(11) &lt.eq 14 &lt.eq 11 + 1 + 2 sqrt(11)
    5.36 &lt.eq 5 &lt.eq 18.63
$

= Problem 3

Baby step, giant step in eliptic curve group.

= Problem 4

chapter 6.6 in other book in modules page.

Lenstra algorithm is a way to find factors of numbers in eliptic curve groups.
it does this by trying different curves that all share a common point to find
some point on the curve that cannont be calculated using the trivial point
addition. This happens when the points are tanget to the curve, this is not a
strict addtion however as only the values $k! P$ are computed.

In that way, once a value is found it can be used as a way to find a factor for the values.

= Problem 5

index calculus for arithmatic groups


lots of work and reading needed here

Problem 5 (6 points). In this problem, you will learn about the index calculus method for
computing a discrete logarithm in F∗p where p is prime. The general strategy consists of:
(1) Choose a small list of primes, called the factor base. This is the collection of primes that
we will allow when factoring numbers modulo p. The goal is to find powers of g whose
values modulo p factor completely into primes from this list.
(2) Find powers of the base g whose values modulo p factor completely over the factor base.
(3) Convert these factorizations into linear congruences for the unknown discrete logarithms of the primes in the factor base.
(4) Solve the resulting system of linear equations.
(5) Use one additional smooth relation to compute the discrete logarithm of the target value.


In this problem, we let p = 53 and let g = 39. Note that p is prime, and one can check that g = 39 is a primitive root modulo 53, that is, the (multiplicative) order of g is p − 1 = 52.
Let the factor base be

$
    39^3 = 12 = 2^2 dot 3 med (mod 53) \
    39^3 = 44 = 2^2 dot 11 med (mod 53) \
    39^5 = 20 = 2^2 dot 5 med (mod 53) \
    39^8 = 28 = 2^2 dot 7 med (mod 53) \
    39^11 = 18 = 2 dot 3^2 med (mod 53) \
$

$
    log 3 = log 2^2 dot 3 = x_2^2 x_3 med (mod 53) \
    log 3 = log 2^2 dot 11 = x_2^2 x_11 med (mod 53) \
    log 5 = log 2^2 dot 5 =x_2^2 x_5 med (mod 53) \
    log 8 = log 2^2 dot 7 = x_2^2 x_7 med (mod 53) \
    log 11 = log 2 dot 3^2 = x_2 x_3^2 med (mod 53) \
$

par a can be solved by

how can I take discrete logs, thats hard.

where solve for things in terms of small DLP and the do a type of CRT on them to find the final values.

To solve the sytems, we can brute force the dlp by using wolfram alpha.


= Problem 6

solve and example simple-LWE problem

= Sources

None
