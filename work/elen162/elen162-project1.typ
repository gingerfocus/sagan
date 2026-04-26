#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ELEN162 - Project 1", columns: 1, author: "Evan Stokdyk")

#import "@preview/quill:0.7.2" as quill: tequila as tq

#let Op(A) = $accent(#A, \^)$
#let ip(x, y) = $lr(angle.l #x, #y angle.r)$
#let proj(v, u) = $frac(ip(#v, #u), ip(#u, #u))$
#let eval(content, size: 100%) = $lr(#content |)$
#let isq(num) = $1/sqrt(#num)$
#let laplace = scale(150%,$cal(L)$)
#show math.equation: set block(breakable: true)

= Problem 1

If using the operator $Op(U)_f$ with brute force it would take $2^10$ attempts
as you would need to, in the worst case try all possible arrangments of bits.
However, you would only need 10 particles to preform this

If you instead used grovers algorithm then you would be able to do it much
quicker. But would need 10 + 1 particles.



= Problem 2

The prime factors of 39 are 3 and 13 which means we can construct the group as:

$
    ZZ_39^* = { 1, 2, 4, 5, 7, 8, 10, 11, 14, 16, 17, 19, 20, 22, 23, 25, 28, 29, 31, 32, 34, 35, 37, 38 }
$

This group has 24 (or $phi(39)$) elements.

The table below has the order of each element and its y value.

#table(
    columns: 3,
    [*a*], [*r*], [*$a^(r/2)$*],
    [1],  [1],  [n/a],
    [2],  [12], [25],
    [4],  [6],  [25],
    [5],  [4],  [25],
    [7],  [12], [25],
    [8],  [4],  [25],
    [10], [6],  [25],
    [11], [12], [25],
    [14], [2],  [14],
    [16], [3],  [n/a],
    [17], [6],  [-1],
    [19], [12], [25],
    [20], [12], [25],
    [22], [3],  [n/a],
    [23], [6],  [-1],
    [25], [2],  [25],
    [28], [12], [25],
    [29], [6],  [14],
    [31], [4],  [25],
    [32], [12], [25],
    [34], [4],  [25],
    [35], [6],  [14],
    [37], [12], [25],
    [38], [2],  [-1],
)

As seen above there are 18 elements with a non trivail square root and 24
elements total.

As such there is a 75% chance that a randomly selected number will allow finding
a prime factor of N.

#h(1fr) $ballot$

= Problem 3

$
    phi(39) &= phi(13) dot phi(3) = 12 dot 2 = 24
$

Thus the max posisble value for the order of a number (r) is 24 so we can use
this as an upper bound in fraction expansion later.

$
    2^(-L) < 1/2r^2
    -L < log(1/2(24)^2)
    L > 10.169925
$

Thus $accent(omega, ~)$ must match $omega$ to 11 bits to get a unique value of r.

We can convert the binary expansion to decimal to help with fraction expansion.

$ 0.10010101010100110110_2 = 0.5833034515380859375_10 $

This can be converted to a fraction as such:

$
    305819/524288 &= 5833034515380859375/10000000000000000000 \
    305819/524288 &= (524288/305819)^(-1) \
        &= (1 + 218469/305819)^(-1) \
        &= (1 + (305819/218469)^(-1))^(-1) \
        &= (1 + (1+87350/218469)^(-1))^(-1) \
        &= (1+(1+(218469/87350)^(-1))^(-1))^(-1) \
        &= (1+(1+(2+43769/87350)^(-1))^(-1))^(-1) \
        &= (1+(1+(2+(87350/43769)^(-1))^(-1))^(-1))^(-1) \
        &= (1+(1+(2+(1+43581/43769)^(-1))^(-1))^(-1))^(-1) \
        &= (1+(1+(2+(1+(43769/43581)^(-1))^(-1))^(-1))^(-1))^(-1) \
        &= (1+(1+(2+(1+(1+188/43581)^(-1))^(-1))^(-1))^(-1))^(-1) \
        &= (1+(1+(2+(1+(1+(43581/188)^(-1))^(-1))^(-1))^(-1))^(-1))^(-1) \
        &= (1+(1+(2+(1+(1+(231+153/188)^(-1))^(-1))^(-1))^(-1))^(-1))^(-1) \
        &= (1+(1+(2+(1+(1+(231+(188/153)^(-1))^(-1))^(-1))^(-1))^(-1))^(-1))^(-1) \
        &= (1+(1+(2+(1+(1+(231+(1+35/153)^(-1))^(-1))^(-1))^(-1))^(-1))^(-1))^(-1) \
        v(x) &= (1+(1+(2+(1+(1+(231+(1+x)^(-1))^(-1))^(-1))^(-1))^(-1))^(-1))^(-1) \
        v(35/153) &= v((153/35)^(-1)) \
        &= v((4+13/35)^(-1)) \
        &= v((4+(35/13)^(-1))^(-1)) \
        &= v((4+(2+9/13)^(-1))^(-1)) \
        &= v((4+(2+(13/9)^(-1))^(-1))^(-1)) \
        &= v((4+(2+(1+4/9)^(-1))^(-1))^(-1)) \
        &= v((4+(2+(1+(9/4)^(-1))^(-1))^(-1))^(-1)) \
        &= v((4+(2+(1+(1+1/4)^(-1))^(-1))^(-1))^(-1)) \
        &= v((4+(2+(1+(1+4^(-1))^(-1))^(-1))^(-1))^(-1)) \
$

Thus, $305819/524288 = [1, 1, 2, 1, 1, 231, 1, 4, 2, 1, 1, 4]$.

Given the end condition that the error is less than:
$
    1/2r^2 = 8.68055556 times 10^(-4)
$

We can apply seccusivly larger sequences of the fraction decompisition until we
end below this:

$

    0.4166965485 &= 0.5833034515380859375 - [1] \
    0.08330345154 &= 0.5833034515380859375 - [1, 1] \
    0.01669654846 &= 0.5833034515380859375 - [1, 1, 2] \
    0.01187488011 &= 0.5833034515380859375 - [1, 1, 2, 1] \
    2.98817952 dot 10^(-5) &= 0.5833034515380859375 - [1, 1, 2, 1, 1] \
$

This continued fraction can be turned back into a regular fraction:
$
    [1, 1, 2, 1, 1] = 1/(1+1/(2+1/(1+1/1))) = 7/12
$

This means the order of 11 in $ZZ_39^*$ is 12.

To use this value to fractor 39 we can first find y:
$
    y = x^(r/2) = 11^(12/2)= 25 (mod 39)
$

Now using y, we can find some factors of N.

$
    gcd(y+1, N) = gcd(24, 39) = 3 \
    gcd(y-1, N) = gcd(26, 39) = 13

$

If the estimated eigen value had corsponded to s=3 then it would have simplified
with the 12 and the continued fraction would be 1/4. Thus, the algorithm would
find 4 as the order of the number which is not true.

As such the only valid values of s are the ones that are coprime with 12.
$ {1, 5, 7, 11} $

#h(1fr) $ballot$

= Problem 4

We can rewrite the binary expansion as a decimal expansion.

$0.1001110011_2 = 0.6123046875_10$

Then, we can similarly expand as a continued fraction.

$
    0.6123046875 &= 6123046875/10000000000 \
        &= 627/1024 \
        &= (1+397/627)^(-1) \
        &= (1+(1+230/397)^(-1))^(-1) \
        &= (1+(1+(1+167/230)^(-1))^(-1))^(-1) \
        &= [1, 1, 1, 230/167] \
        &= [1, 1, 1, 1, 167/63] \
        &= [1, 1, 1, 1, 2, 63/41] \
        &= [1, 1, 1, 1, 2, 1, 41/22] \
        &= [1, 1, 1, 1, 2, 1, 1, 22/19] \
        &= [1, 1, 1, 1, 2, 1, 1, 1, 19/3] \
        &= [1, 1, 1, 1, 2, 1, 1, 1, 8, 3] \
$

We want to be lower than the same error above (question 3).

$
    0.387695312 &= 0.6123046875 - [1] \
    0.112304687 &= 0.6123046875 - [1, 1] \
    0.054361979 &= 0.6123046875 - [1, 1, 1] \
    0.012304687 &= 0.6123046875 - [1, 1, 1, 1] \
    0.003079927 &= 0.6123046875 - [1, 1, 1, 1, 2] \
    0.001193576 &= 0.6123046875 - [1, 1, 1, 1, 2, 1] \
    5.98538306 dot 10^(-4) &= 0.6123046875 - [1, 1, 1, 1, 2, 1, 1] \
$

$ [1, 1, 1, 1, 2, 1, 1] = 19/31 $

Thus, this finds 31 as the order of 11 mod 39 which is not correct. We can only
be confident that the first 4 bits are correct but the fraction expansion of
19/31 uses more than that (31 is on the order of 32 which is $2^5$) so it is
likely that the fifth bit of the binary expansion is wrong which causes or
estimate to be wrong.

#h(1fr) $ballot$

= Problem 5

Given the random value of $x=5$ and an oracle for finding the order in a
specific feild it is possible to find the factors of N as such:

$
    5^r = 5^176 = 1 (mod 391) \
    y = x^(r/2) = 5^(176/2) = 254 (mod 391) \
    gcd(y+1, N) = gcd(255, 391) = 17 \
    gcd(y-1, N) = gcd(253, 391) = 23 \
$

To use this to decript the message we must find the decrypton key first

$
    phi(N) = phi(391) = phi(17)phi(23) = 16 dot 22 = 352 \
    b dot d = 1 (mod phi(N)) \
    31 dot d = 1 (mod 352) \
    d = 159 (mod 352)
$

Now we can use that to decrypt the message:

$
    m = y^d = 132^159 (mod N)
    m = 21 (mod 391)
$

The secret message is 21.

#h(1fr) $ballot$

