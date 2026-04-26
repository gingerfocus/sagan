#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "MATH178 - W25 - Homework 8", columns: 1, author: "Evan Stokdyk")

= Problem 1 

The following is the process to sign a message with an ElGamal:
$
    (x, k_E, p, alpha, d) &= (45, 9, 71, 7, 19) \
    beta &= alpha^d = 7^19 = 56 med (mod 71)\ 
    r &= alpha^(k_E) med (mod p) \
    r &= 7^(9) = 47 med (mod 71) \
    s &= (x - d dot r) med k_E^(-1) med (mod p-1) \
    s &= (45 - 19 dot 47) med 9^(-1) = 62 dot 39 = 38 med (mod 70) \
$

The message sent is (x=45, s=38).

#h(1fr) $ballot$

= Problem 2

Existential forgery is an attack where you first choose a valid signature and
then work backwords to find a valid plaintext for that signature. The attacker
has no control over the coresponsding plaintext and it is essentially random.
However, the attacker can repeat this process until the generate a message they
deem useful. Eve is essentially running the process in reverse where her
signature is the message, the message is the signature and her private key is
Bob's public key.

The attacker controls the cipher text and knows the public key. Therefore, she
can compute what the verification of the signature will be. That is used as the
message so it is essential random other than selection bias.

The most important reasons to sign the hash of the message is practicality as it
means regardless of the size of the message the signature calculation is
relativly easy. If x is simply just the bytes of the message, sending a 2Gb file
would involve massive numbers. A second reason is security as similar messeges
would have a predictable change in signature but hashes ensure that small in the
source document propogate to the signature.

#h(1fr) $ballot$

= Problem 3

Given the following declarations on i and j:
$
    r &= alpha^i dot beta^j (mod p) \
    s &= -r j^(-1) (mod p-1) \
    x &= i dot s (mod p-1) \
$

It is possible to show that these construct a valid signature:
$
    r &= alpha^i dot beta^j (mod p) \
    s &= mu (p-1) - r dot j^(-1) \
    r^s &= (alpha^i dot beta^j)^(-r j^(-1) + mu (p-1)) (mod p) \
    r^s &= alpha^(i dot s) dot beta^(j(-r dot j^(-1) + mu (p-1))) (mod p) \
    r^s &= alpha^(i s) dot beta^(-r) (mod p) \
    r^s dot beta^r &= alpha^x (mod p) \
$

#h(1fr) $ballot$

= Problem 4

DSA signatures

Given the initial information:
$
    (p, q, alpha, beta, d) &= (79, 13, 18, 46, 5) \
    k_E &= 4
$

We can sign a message with DSA as follows:
$
    r &= (alpha^(k_E) mod p) mod q \
    r &= (18^(4) mod 79) mod 13 = 12 mod 13 \
    s &= ("SHA"(x) + d dot r) med k_E^(-1) med (mod q) \
    s &= ("SHA"(9) + 5 dot 12) med 4^(-1) = 69 dot 10 = 2 med (mod 13)
$

Verification for $(x, r, s) = (8, 12, 1)$ can be done as follows:
$
    w &= s^(-1) mod q \
    w &= 1^(-1) = 1 mod 13 \
    u_1 &= w "SHA"(x) mod q \
    u_1 &= 1 "SHA"(8) = 8 (mod 13)  \
    u_2 &= w dot r mod q \
    u_2 &= 1 dot 12 = 12 mod 13 \
    v &= (alpha^(u_1) dot beta^(u_2) mod p) mod q \
    v &= (18^(8) dot 46^(12) mod 79) mod 13 = 0 \
$

the signature is invalid as $v eq.not r$.

To now verify for $(x, r, s) = (9, 12, 1)$ we can again check:
$
    w &= s^(-1) mod q \
    w &= 1^(-1) = 1 mod 13 \
    u_1 &= w "SHA"(x) mod q \
    u_1 &= 1 "SHA"(9) = 9 mod 13  \
    u_2 &= w dot r mod q \
    u_2 &= 1 dot 12 = 12 mod 13 \
    v &= (alpha^(u_1) dot beta^(u_2) mod p) mod q \
    v &= (18^(9) dot 46^(12) mod 79) mod 13 = 0 \
$
once again, the signature is invalid as $v eq.not r$.

#h(1fr) $ballot$

= Problem 5

#let width = 100%;

#figure(
    grid(
        columns: 3, // Specifies 2 columns (auto-sized by default)
        gutter: 15pt, // Space between images
        align: center,
        image("g1.png", width: width),
        image("g2.png", width: width),
        image("g3.png", width: width),
        image("g4.png", width: width),
        image("g5.png", width: width),
    ),
    caption: [Graphs of 5 different Eliptic Curves.]
)
+ $y^2 = x^3 -7x + 3$: *Top Left*. Zero values (-2.86, 0.44, 2.40)
+ $y^2 = x^3 - 7x + 9$: *Top Middle*. Zero values (-3.14)
+ $y^2 = x^3 - 7x - 12$: *Top Right*. Zero values (3.26)
+ $y^2 = x^3 -3x + 2$: *Bottom Left*. Zero values (-2, 1)
+ $y^2 = x^3$: *Bottom Middle*. Zero values (0)

#h(1fr) $ballot$

= Problem 6

Yes. $y^2 = x^3 + x + 2$ has the correct form and the point (0, 0) trivially
exists.

#h(1fr) $ballot$

= Problem 7

Given the eliptic curve $E: y^2 = x^3 + 1$ basic operations can be preformed
using the lambda form:
$
    P + Q &= (2, 3) + (-1, 0) \
    lambda &= (3 - 0)/(2 - (-1)) = 1 \
    x_3 &= lambda^2 - x_1 - x_2 = 1 - 2 - (-1) = 0 \
    y_3 &= lambda (x_1 - x_3) - y_1 = 1(2 - 0) - 3 = -1 \
    P + Q &= (0, -1)
$

When the points are coincident, the tanget slope is used:
$
    P + P &= (2, 3) + (2, 3) \
    lambda &= (3 x^2 + a)/(2 y) \
    lambda &= (3 2^2 + 0)/(2 3) = 2 \
    x_3 &= lambda^2 - x_1 - x_2 = 2^2 - 2 - 2 = 0 \
    y_3 &= lambda (x_1 - x_3) - y_1 = 2 (2 - 0) - 3 = 1 \
    P + P &= (0, 1)
$

We can use the intermediate value from above to add again:
$
    3P &= 2P + P = (0, 1) + (2, 3) \
    lambda &= (1 - 3)/(0 - 2) = -2/-2 = 1 \
    x_3 &= lambda^2 - x_1 - x_2 = 1^2 - 0 - 2 = -1 \
    y_3 &= lambda (x_1 - x_3) - y_1 = 1 (0 - -1) - 1 = 0 \
    3P &= (-1, 0)
$

#h(1fr) $ballot$

= Sources

Desmos was used to create graphs.

// {
// #import "@preview/cetz:0.4.2": canvas, draw
// #import "@preview/cetz-plot:0.1.3": plot

// #let style = (stroke: black, fill: rgb(0, 0, 200, 75))

// #let f1(x) = {
//     let y = calc.pow(x, 3) - x*7 + 3
//     if y < 0 { return 0 }
//     return calc.sqrt(y)
// }

// #set text(size: 10pt)

// #canvas({
//   import draw: *

//   // Set-up a thin axis style
//   set-style(axes: (stroke: .5pt, tick: (stroke: .5pt)),
//             legend: (stroke: none, orientation: ttb, item: (spacing: .3), scale: 80%))

//   plot.plot(size: (12, 8),
//       x-tick-step: 1,
//       // x-format: plot.formats.multiple-of,
//       // y-tick-step: 2, y-min: -2.5, y-max: 2.5,
//     legend: "inner-north",
//     {
//       let domain = (-4, 4)

//       // for ((title, f)) in fn {
//       //   plot.add-fill-between(f, f1, domain: domain,
//       //     style: (stroke: none), label: title)
//       // }

//       plot.add(f1, domain: domain, 
//         style: (stroke: black))
// // label: $ sin x $,

//         plot.add(x => -f1(x), domain: domain,
//         style: (stroke: black))
//     })
// })
// }
