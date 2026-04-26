#import "./lib/pset.typ" as pset
#show: pset.ieee.with(title: "MATH178 - W25 - Homework 3", columns: 1, author: "Evan Stokdyk")

#set text(16pt)

= Problem 1: Asmuth–Bloom secret sharing

A group of people uses a toy version of CRT-based secret sharing. The public moduli are

#align(center)[$m_0 = 7, wide m_1 = 11, wide m_2 = 13, wide m_3 = 17, wide m_4 = 19$]

which are pairwise coprime. The dealer hid the secret s by choosing an integer

#align(center)[$0 ≤ s < m_0, wide x = s + alpha m_0$]

and distributing the shares $s_i ≡ x (mod m_i)$.

Unfortunately, one share got corrupted, but three participants still have correct shares:

#align(center)[$x ≡ 8 (mod 11), x ≡ 6 (mod 13), x ≡ 3 (mod 19)$]

#line(length: 100%)

Use CRT to determine the unique integer x with
#align(center)[ $0 ≤ x < 11 dot 13 dot 19$]

== Part A

Although we can only find a solution that

TODO

// $ sum_(n=1)^infinity a_n $ 
// $ display(lim_(n arrow.r infinity) a_n = 0) $
// $ exists k in NN |a_k-0| < epsilon $
// $(a_n)^(n/(n+1)) lt.eq (a_n)^(1/2) $
// $ frac((a_(n+1))^(1/2) , (a_(n))^(1/2) ) < 1 $

#line(length: 100%)

Recover the secret s (i.e., compute x (mod 7)).

$$

== Solution

Trivial


= Problem 2

List all 8 such polynomials and factor each of them in $FF_2[x]$ as a product of irreducible polynomials.

== Solution

We know that each function either is irreducible or constructable of other
irreducible polynomials. The only irreducible polynomials less than $x^2$ are
$x, med x+1, med x^2+x+1$

It is very easy to test if something is divisible by x and testing against x+1
can be done by mentally multiplying with the two ($x^2+1$, $x^2+x+1$) possible
non trivial values where x^2 is non zero.

Something can only have one term of $x^2+x+1$ as if it had two it would have
multiplicity four. Therefore, it will always show up as the result after
dividing two of the other terms.

Using these facts it is possible to generate @polynomial-table.

#figure(caption: "caption")[
    #table(
        stroke: none,
        columns: 2,
        [$x^3 + 0x^2 + 0x + 0 = $], [$(x)(x)(x)$], 
        [$x^3 + 0x^2 + 0x + 1 = $], [$(x+1)(x^2+x+1)$],
        [$x^3 + 0x^2 + 1x + 0 = $], [$(x)(x+1)(x+1) $], 
        [$x^3 + 0x^2 + 1x + 1 = $], [$x^3+x+1$], 
        [$x^3 + 1x^2 + 0x + 0 = $], [$(x)(x)(x+1)$], 
        [$x^3 + 1x^2 + 0x + 1 = $], [$x^3+x^2+1$], 
        [$x^3 + 1x^2 + 1x + 0 = $], [$(x)(x^2+x+1)$], 
        [$x^3 + 1x^2 + 1x + 1 = $], [$(x+1)(x+1)(x+1)$], 
    )
] <polynomial-table>

#h(1fr) $ballot$

= Problem 3 
Compute (x3 + x + 1)(x3 + x2 + 1) in $FF_16$.

$$

== Solution

#align(center)[$(x^3 + x + 1)(x^3 + x^2 + 1)$] 
#align(center)[$x^6 + x^5 + x^3 + x^4 + x^3 + x + x^3 + x^2 + 1$] 
#align(center)[$x^6 + x^5 + x^4 + 3x^3 + x^2 + x + 1$] 
#align(center)[$x^4(x^2) + x^4(x) + x^4 + 1x^3 + x^2 + x + 1$] 
#align(center)[$(x+1)(x^2) + (x+1)(x) + (x+1) + x^3 + x^2 + x + 1$] 
#align(center)[$(x^3 + x^2) + (x^2 + x) + x + 1 + x^3 + x^2 + x + 1$] 
#align(center)[$2x^3 + 3x^2 + 3x + 2$] 
#align(center)[$x^2 + x$] 

#line(length: 100%)

Find the first 15 powers of x in $FF_16 = FF_2[x]  \/ (x^5+x^2+1)$. 

$$

== Solution

Note that in this feild $x^5 = x^2 +1$.

#let eqi = table.cell(
  // fill: green.lighten(60%),
)[$equiv$]

#align(center)[
    #table(
        columns: 5,
        stroke: none,
        align: left,
        // inset: 6pt,
        [$x^1$], [$equiv$], [$x$], [], [], 
        [$x^2$], [$equiv$], [$x^2$], [], [], 
        [$x^3$], [$equiv$], [$x^3$], [], [], 
        [$x^4$], [$equiv$], [$x^4$], [], [], 
        [$x^5$], [$equiv$], [$x^5$], eqi, [$x^2 + 1$], 
        [$x^6$], [$equiv$], [$x^3+x$], [], [], 
        [$x^7$], [$equiv$], [$x^4+x^2$], [], [], 
        [$x^8$], [$equiv$], [$x^5+x^3$], eqi, [$x^3+x^2+1$], 
        [$x^9$], [$equiv$], [$x^4+x^3+x$], [], [], 
        [$x^10$], [$equiv$], [$x^5+x^4+x^2$], eqi, [$x^4+1$], 
        [$x^11$], [$equiv$], [$x^5+x$], [], [$x^2+x+1$], 
        [$x^12$], [$equiv$], [$x^3+x^2+x$], [], [], 
        [$x^13$], [$equiv$], [$x^4+x^3+x^2$], [], [], 
        [$x^14$], [$equiv$], [$x^5+x^4+x^3$], eqi, [$x^4+x^3+x^2+1$], 
        [$x^15$], [$equiv$], [$x^4+x^3+x$], eqi, [$x^4+x^3+x^2+x+1$], 
    )
]

#line(length: 100%)

The group of units F∗16 has exactly 15 elements, namely all the elements except for zero.
Does x3 multiplicatively generate all elements of F∗16 ? In other words, is it true that
every element of F∗16 is some power of x3 ?

== Solution

= Problem 4 (4 points).
Consider the two polynomials x5 + x2 + 1 and x3 + x2 + x + 1 in
F2 [x]. Find gcd(x5 + x2 + 1, x3 + x2 + x + 1).
Hint. Apply the Euclidean Algorithm. At each step, instead of the usual division algorithm
for two integers, you will need to use long division of polynomials.

$$

== Solution

TODO

= Problem 5 (4 points).
Consider the finite field F32 = F2 [x]/(x5 + x2 + 1). Find the
multiplicative inverse of x3 + x2 + x + 1 in F32 .

_Hint_. The goal is to find polynomials b(x) and c(x) in F2 [x] such that

$ (x^3 + x^2 + x + 1) dot b(x) + (x^5 + x^2 + 1) dot c(x) = 1 $ <p5-hint>

Once this is accomplished, the multiplicative inverse of x3 + x2 + x + 1 in F32 will be b(x).
Using the steps of the Euclidean Algorithm from Problem 4 above, and the back-substitution
method, you can find polynomials b(x) and c(x) satisfying @p5-hint.

== Solution

TODO

= Sources
None
