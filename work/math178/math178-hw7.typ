#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "MATH178 - W25 - Homework 7", columns: 1, author: "Evan Stokdyk")

= Problem 1 

_Formulate a “woman-in-the-middle” attack to the RSA public key cryptosystem._

In this woman-in-the-middle attack, the goal of eve will be to convince alice
and bob that they are communicating normally and simply log traffic. Eve's
powers are very powerful and risking exposure and possible lossing is bad.

1. Bob initalizes a key exchange by sending (what he belives to be) Alice his public key.
2. Eve intercepts the message. She then sends here key to encrypted with Bobs
key to Bob and her key in plain text to Alice.
3. Bob, beliving to have recieved a correct response uses Eve's key to send a
message to Eve.
4. Eve recieves Bobs message and waits until Alice responds.
5. Alice completes the handshake with Eve and Eve now responds with Bobs message
encryptied with Alices key.
6. Eve continues to facilitate the message passing bewtween Bob and Alice and
logs the plaintext message.

Eve can preform long term analysis on the communications as direct intervention.
Ideally, damage she causes happens long after Alice and Bob have closed their
communication. Additionally, assuming she can fake the orgin of network traffic
eve can now also impersonate Alice or Bob by just initiating handshakes from
their address.

#h(1fr) $ballot$

= Problem 2

The first step is to find the inverse of $d = e (mod phi(N))$. As long as
$phi(N)$ is known this is easy. It is then possible to calculate:

$
    x = c^d = x^e^d = x^(e d) = x
$

#h(1fr) $ballot$

= Problem 3 A
_Find p and q such that $N = 352717$ and $phi(N) = 351520$._

First expand the function $phi(N)$:
$
    phi(N) &= (p-1)(q-1) \
    phi(N) &= p q - p - q + 1 \
    phi(N) &= N - p - q + 1 \
    p = N - phi(N) - q + 1 \

    N &= p q = (N - phi(N) - q + 1) q
$

Now we can solve for q by pluging in values.
$
    N &= (N - phi(N) - q + 1) q \
    352717 &= (352717 - 251520 - q + 1) q \
    352717 &= 1198 q - q^2 \
    q^2 - 1198 q + 352717 &= 0 \
    q &= 677 or q = 521
$

These numbers can be checked and show that $677 dot 521 = N$.

#h(1fr) $ballot$

= Problem 3 B
_Find p and q such that $N = 77083921$ and $phi(N) = 77066212$._

We can reuse part of the partial result and plug in values.

$
    N &= (N - phi(N) - q + 1) q \
    77083921 &= (77083921 - 77066212 - q + 1) q \
    77083921 &= 17710 q - q^2 \
    q^2 - 17710 q + 77083921 &= 0 \
    q &= 10007 or q = 7703
$


Again we can check that $ 10007 dot 7703 = N$.

#h(1fr) $ballot$

= Problem 4

*Part A*

For Alice to encrypt a message to Bob she must do:
$
    c &= m^e (mod N) \
    c &= 892383^(103) (mod 2038667) \
    c &= 45293
$

*Part B*

Bobs first factor is 1301 so the the other factor of $N=1301 dot 1567$. Thus he
must first find $phi(N)$ such that he can find the inverse of e in the ring:

$
    phi(N) &= phi(1301) phi(1567) \
    phi(N) &= 1300 dot 1566 \
    phi(N) &= 2035800         \        
    d &= e^(-1) (mod phi(N)) \
    d &= 103^(-1) (mod 2035800) \
    d &= 810367
$

*Part C*

Bob can decript the message by raising it to his encryption exponent.

$
    m &= c^d (mod N)
    m &= 317730^(810367) (mod 2038667)
    m &= 514407 (mod 2038667)
$

#h(1fr) $ballot$

= Problem 5

For $N=12191$ the factors are 73 and 167. This was found using the standard
'factor' utility avaiable on all unix computers. Thus it is possible calculate
the secret key:

$
    phi(N) &= phi(12191) &&= phi(73) phi(167)  \
    phi(N) &= 72 dot 166 &&= 12024 \
    d &= e^(-1)(mod phi(N)) &&= 37^(-1) (mod 12024)
    d &= 325 (mod 12024)
$

Now knowing d it is possible for Eve to decrypt Alice's message:

$
    m &= c^d (mod N)
    m &= (587)^(325) (mod 12191)
    m &= 10296 (mod 12191)
$

#h(1fr) $ballot$


= Problem 6

a) Most primality tests are in reality composites tests and either conclusivly
show that the number is prime or are inconclusiive. 

b) Uses the contrapositive of fermats theorum to test for primes. It raises a
random number to n-1 modulos n. It the number is not one then the number is
composite. Otherwise the test is inconclusive and needs to be repeated. Each
random number has a 50% chance to be a "witness" for n primality. As such if the
test is inconclusive k times then the number is prime with probability $1 - (1/2)^k$.

c) There exist Charmichle numbers which have no witnesses for their
compositness.

= Sources

#link("https://www.calculatorsoup.com/calculators/algebra/quadratic-formula-calculator.php")[Online quadractic equation calculator].
