#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ELEN162 - Homework 2", columns: 1, author: "Evan Stokdyk")

#import "@preview/quill:0.7.2" as quill: tequila as tq

#let Op(A) = $accent(#A, \^)$
#let ip(x, y) = $lr(angle.l #x, #y angle.r)$
#let proj(v, u) = $frac(ip(#v, #u), ip(#u, #u))$
#let eval(content, size: 100%) = $lr(#content |)$
#let isq(num) = $1/sqrt(#num)$
#let laplace = scale(150%,$cal(L)$)
#show math.equation: set block(breakable: true)

= Problem 1 A

Basic modular arithmatic:

$
    a_1 &= (6+8) mod 5 \ 
    a_1 &= 14 mod 5 \ 
    a_1 &= 4 mod 5
$

Negative numbers are converted as such:
$
    a_2 &= (3-15) mod 7 \
    a_2 &= -12 = -12 + 14 (mod 7) \
    a_2 &= 2 (mod 7)
$

#h(1fr) $ballot$

= Problem 1 B

To calculate $11/5 mod 9$ we first need to find the inverse of 5 mod 9 using the
reverse Euclidian algorithm:
$
    9 &= 1 dot 5 + 4 \ 
    5 &= 1 dot 4 + 1 \
    1 &= 5 - 1 dot 4 \
    1 &= 5 - 1 dot (9 - 1 dot 5) \
    1 &= 2 dot 5 - 1 dot 9 \
$

Thus the inverse exits (2) and we can solve:
$
    a_4 &= (11/5) mod 9 \
    a_4 &= 11 dot 5^(-1) mod 9 \
    a_4 &= 11 dot 2 mod 9 \
    a_4 &= 22 mod 9 \
    a_4 &= 4 mod 9 \
$

For the second question (215/91) we again need to find the inverse. However we must
first use the fact that we can subsitute any value in the same equivelence class:
$
    91 &= 7 mod 14 \
    14 &= 2 dot 7 + 0
$

The greatest common divisior of 14 and 7 is not 1 which means it is not possible
to find and inverse in the group thus no answer exists for $215/91 mod 14$.

#h(1fr) $ballot$

= Problem 2
We can first try to find the gcd using Euclids method:
$
    1785 &= 1(969) + 816 \
    969 &= 1(816) + 153 \
    816 &= 5(153) + 51 \
    153 &= 3(51) + 0 
$

Shown above the gcd of these two elements is 51. This means that these is no
inverse of 1785 in mod 969.

We can solve the second gcd similarly to the first.
$
    833 &= 14(57) + 35 \
    57 &= 1(35) + 22 \
    35 &= 1(22) + 13 \
    22 &= 1(13) + 9 \ 
    13 &= 1(9) + 4 \
    9 &= 2(4) + 1 
$

The gcd of these elements is 1 which means that an invese does exists. This can
be foudn using the inverse Euclidian algorithm.
$
    1 &= 9 - 2(4) \
    1 &= 9 - 2(13 - 1(9)) &= &3(9) - 2(13) \
    1 &= 3(22 - 1(13)) - 2(13) &= &3(22) - 5(13) \
    1 &= 3(22) - 5(35 - 1(22)) &= &8(22) - 5(35) \
    1 &= 8(57 - 1(35)) - 5(35) &= &8(57) - 13(35) \
    1 &= 8(57) - 13(833 - 14(57)) &= &190(57) - 13(833) \
$

By taking the last equation mod 57:
$
    1 &= 190(57) - 13(833) (mod 57) \
    1 &= -13(833) (mod 57) \
    1 &= (57-13)(833) (mod 57) \
    1 &= (44)(833) (mod 57)
$

So in this case x is 44.

#h(1fr) $ballot$

= Problem 3

_Find $1585^x equiv 1 (mod 29)$_

$
    1585^x equiv 1 (mod 29) \
    19^x equiv 1 (mod 29)
$

The factors of 28 (29-1) are 2, 2 and 7. Thus the order of any value must be a
product of these values by Euler's Theorum.

$
    19^2 &= 19 dot 19 &= 13 (mod 29) \
    19^4 &= 19^2 dot 19^2 = 13 dot 13 &= 24 (mod 29) \
    19^7 &= 19^4 dot 19^2 dot 19 = 24 dot 13 dot 19 &= 12 (mod 29) \
    19^14 &= 19^7 dot 19^7 = 12 dot 12 &= 28 (mod 29) \
    19^28 &= 19^14 dot 19^14 = 28 dot 28 &= 1(mod 29) \
$

Thus the value of x is 28. This value is not unique as you can add 28 to get
another solution by Fermat's Theorem.

#h(1fr) $ballot$

= Problem 4

To compute $4108^31 mod 168$ you can replace the base with a value from its
equivlence class.

$
    4108^31 mod 168 \
    76^31 mod 168
$

We can then use fast powering to get useful values:

$
    76^1 &= 76 (mod 168) \
    76^2 &= 76 dot 76 = 64 (mod 168) \
    76^4 &= 76^2 dot 76^2 = 64 dot 64 = 64 (mod 168) \
    76^8 &= 76^4 dot 76^4 = 64 dot 64 = 64 (mod 168) \
    76^16 &= 76^8 dot 76^8 = 64 dot 64 = 64 (mod 168)
$

Now we can factor out the desired value into these values:

$
    76^31 &= 76^16 dot 76^8 dot 76^4 dot 76^2 dot 76^1 (mod 168) \
    76^31 &= 64 dot 64 dot 64 dot 64 dot 76 (mod 168) \
    76^31 &= 64 dot 64 dot 76 (mod 168) \
    76^31 &= 64 dot 76 (mod 168) \
    76^31 &= 160 (mod 168)
$

Thus $4108^31 = 160 (mod 168)$.

For the second identity, we can invoke Femrats theoum as 79 is prime to
simplify:

$
    18^126 = 18^48 (mod 79)
$

We can then do fast powering again.

$
    18^1 equiv 18 (mod 79) \
    18^2 = 18 dot 18 = 8(mod 79) \
    18^4 = 8^2 dot 8^2 = 64 (mod 79) \
    18^8 = 18^4 dot 18^4 = 64 dot 64 = 67 (mod 79) \
    18^16 = 18^8 dot 18^8 = 67 dot 67 = 65 (mod 79) \
    18^32 = 18^16 dot 18^16 = 65 dot 65 = 38 (mod 79)
$

Now these values can factor the large value:
$
    18^48 (mod 79) \
    18^48 = 18^32 dot 18^16 (mod 79) \
    18^48 = 38 dot 65 (mod 79) \
    18^48 = 21 (mod 79)
$

Thus $18^126 = 21 (mod 79)$.

#h(1fr) $ballot$

= Problem 5

To convert 0.25366064 to a continued fraction we need to invert it and take out
a constant on each step:

$
    0.25366064 &= 25366064/100000000 = (100000000/25366064)^(-1) = (3 + 23901808/25366064)^(-1) \
    epsilon^1 &= | 0.25366064 - (3)^(-1) | = 0.07967
$

#align(center)[#line(length: 80%)]

$
    0.25366064 &= (3 + (25366064/23901808)^(-1) )^(-1)  = (3 + (1 + 1464256/23901808)^(-1) )^(-1) \
    epsilon^2 &= | 0.25366064 - (3 + 1^(-1))^(-1) | = 0.00366064
$

#align(center)[#line(length: 80%)]

$
    0.25366064 &= (3 + (1 + (23901808/1464256)^(-1) )^(-1) )^(-1) \
        &= (3 + (1 + (16 + 473712/1464256)^(-1) )^(-1) )^(-1) \

epsilon^3 &= | 0.25366064 - (3 + (1 + 16^(-1))^(-1))^(-1) | = 7.07032836 times 10^(-5)
$

#align(center)[#line(length: 80%)]

At this point, I will sub out the fraction decompisition to continue the expansion with less notation:

$
    s_1(x) &= (3 + (1 + (16 + x)^(-1) )^(-1) )^(-1) \
    0.25366064 &= s_1(473712/1464356) = s_1((1464356/473712)^(-1))  = s_1((3 + 43120/473712)^(-1) ) \
    epsilon^4 &= | 0.25366064 - s_1(3^(-1)) | = 2.10341463 times 10^(-6)
$

#align(center)[#line(length: 80%)]

$
    0.25366064 &= s_1((3 + (473712/43120)^(-1))^(-1) ) = s_1((3+(10 + 42512/43120)^(-1))^(-1)) \
    epsilon^5 &= | 0.25366064 - s_1((3 + 10^(-1))^(-1)) | = - 2.0081247 times 10^(-7)
$

#align(center)[#line(length: 80%)]

$
    0.25366064 &= s_1( (3+(10 + (43120/42512)^(-1))^(-1))^(-1) ) \
        &= s_1((3+(10 + (1 + 608/42512)^(-1))^(-1))^(-1)) \
        epsilon^6 &= | 0.25366064 - s_1((3+(10 + (1)^(-1))^(-1))^(-1)) | = 2.61843239 times 10^(-9)
$

#align(center)[#line(length: 80%)]

I will once again introduce more notation to reduce the complexity of the expressions:

$
    s_2(x) &= s_1((3+(10+(1+x)^(-1))^(-1))^(-1)) \
    0.25366064 &= s_2(608/42512) = s_2((42512/608)^(-1)) = s_2((69+560/608)^(-1)) \
    epsilon^7 &= | 0.25366064 - s_2(69^(-1)) | = 3.44965657 times 10^(-11)
$

#align(center)[#line(length: 80%)]

$
    0.25366064 &= s_2((69+(608/560)^(-1))^(-1)) = s_2((69+(1+48/560)^(-1))^(-1)) \
    epsilon^8 &= | 0.25366064 - s_2((69+1^(-1))^(-1)) | = 2.91515089 times 10^(-12)
$

#align(center)[#line(length: 80%)]

$
    0.25366064 &= s_2((69+(1+(560/48)^(-1))^(-1))^(-1)) \
        &= s_2((69+(1+(11 + 32/48)^(-1))^(-1))^(-1)) \
        epsilon^9 &= | 0.25366064 - s_2((69+(1+11^(-1))^(-1))^(-1)) | = 1.62143373 times 10^(-13)
$

#align(center)[#line(length: 80%)]

Again more notation is needed:

$
    s_3(x) &= s_2((69+(1+(11+x)^(-1))^(-1))^(-1)) \
    0.25366064 &= s_3(32/48) = s_3((48/32)^(-1)) = s_3((1 + 16/32)^(-1)) \
        epsilon^10 &= | 0.25366064 - s_3(1^(-1)) | = 7.48286307 times 10^(-14)
$

#align(center)[#line(length: 80%)]

$
    0.25366064 &= s_3((1 + (32/16)^(-1))^(-1)) = s_3((1 + 2^(-1))^(-1)) \
    epsilon^11 &= | 0.25366064 - s_3((1+2^(-1))^(-1)) | = 0
$

Thus, by subbing the partial results back together we get:
$
    0.25366064 &= [3, 1, 16, 3, 10, 1, 69, 1, 11, 1, 2] \
    0.25366064 &= 1/(3+1/(1+1/(16+1/(3+1/(10+1/(1+1/(69+1/(1+1/(11+1/(1+1/2)))))))))) \
$

#h(1fr) $ballot$

= Problem 6

The elements of each set are as follows:
$
    ZZ_7^* &= {1, 2, 3, 4, 5, 6} \
    ZZ_8^* &= {1, 3, 5, 7} \
    ZZ_14^* &= {1, 3, 5, 9, 11, 13}
$


We can list the order of every element in each group:

#align(center)[#stack(
    dir: ltr,
    spacing: 10%,
    table(
        columns: 2,
        [*a*], [*order in $ZZ_7^*$*],
        [2], [3],
        [3], [6],
        [4], [3],
        [5], [6],
        [6], [2],
    ),
    table(
        columns: 2,
        [*a*], [*order in $ZZ_8^*$*],
        [3], [2],
        [5], [2],
        [7], [2],
    ),
    table(
        columns: 2,
        [*a*], [*order in $ZZ_14^*$*],
        [3], [6],
        [5], [6],
        [9], [3],
        [11], [3],
        [13], [2],
    ),
)]

The groups $ZZ_7^*$ and $ZZ_14^*$ are cyclic as they each have an element with
order equal to the number of elements in them. Without checking the table,
$ZZ_7^*$ must by cyclic as it is a prime feild.

The generators are all elements that have order equal to the number of elements
being 3 and 6 in $ZZ_7^*$ as well 3 and 5 in $ZZ_14^*$

#h(1fr) $ballot$
