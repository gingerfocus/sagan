#import "@local/pset:0.1.0" as pset
#import "@preview/quill:0.7.2" as quill: tequila as tq

#show: pset.ieee.with(title: "ELEN162 - Homework 2", columns: 1, author: "Evan Stokdyk")

// #set text(16pt)

#let Op(A) = $accent(#A, \^)$
#let ip(x, y) = $lr(angle.l #x, #y angle.r)$
#let proj(v, u) = $frac(ip(#v, #u), ip(#u, #u))$
#let eval(content, size: 100%) = $lr(#content |)$
#let isq(num) = $1/sqrt(#num)$
#let laplace = scale(150%,$cal(L)$)
#show math.equation: set block(breakable: true)

= Problem 1 A

An operator is linear if it satisfies $Op(A)(a x + b y) = a Op(A) x + b Op(A) y$.
This condition can be tested for each of the three operators.

For $Op(A)_1$:
$
    Op(A)_1 (a psi_a + b psi_b ) &eq.quest a Op(A)_1 psi_a + b Op(A)_1 psi_b \
    dif/(dif t) (a psi_a + b psi_b ) + 3(a psi_a + b psi_b)  &eq.quest a lr([ dif/(dif t) psi_a + 3 psi_a ]) + b lr([ dif/(dif t) psi_b + 3 psi_b ]) \

        a dif/(dif t) psi_a + b dif/(dif t) psi_b + 3a psi_a + 3 b psi_b &= a dif/(dif t) psi_a +  3 a psi_a + b dif/(dif t) psi_b + 3 b psi_b
$

For $Op(A)_2$:
$
    Op(A)_2 (a psi_a + b psi_b ) &eq.quest a Op(A)_2 psi_a + b Op(A)_2 psi_b \
    dif^2/(dif t^2) (a psi_a + b psi_b ) &eq.quest a lr([ dif^2/(dif t^2) psi_a]) + b lr([ dif^2/(dif t^2) psi_b]) \
    a dif^2/(dif t^2) psi_a + b dif^2/(dif t^2) psi_b &= a dif^2/(dif t^2) psi_a + b dif^2/(dif t^2) psi_b
$

For $Op(A)_3$:
$
    Op(A)_3 (a psi_a + b psi_b ) &eq.quest a Op(A)_3 psi_a + b Op(A)_3 psi_b \
    dif^2/(dif t^2) (a psi_a + b psi_b) - 4 k^2 t^2 (a psi_a + b psi_b) &eq.quest a lr([ dif^2/(dif t^2) psi_a - 4 k^2 t^2 psi_a]) + b lr([ dif^2/(dif t^2) psi_b - 4 k^2 t^2 psi_b]) \
    a dif^2/(dif t^2) psi_a + b dif^2/(dif t^2) psi_b - 4a k^2t^2 psi_a - 4b k^2t^2 psi_b 
        &= a dif^2/(dif t^2) psi_a - 4a k^2t^2 psi_a + b dif^2/(dif t^2) psi_b - 4b k^2t^2 psi_b 
$

All 3 operators are linear.

#h(1fr) $ballot$

= Problem 1 B


By inspection, 

$
    laplace { Op(A)_1 f } &= laplace { dif /(dif t) f + 3 f } \
    laplace { Op(A)_1 } F &= s F - f(0) + 3 F \
    laplace { Op(A)_1 } F &= (s + 3) F - f(0) \
    laplace { Op(A)_1 } / (s + 3) F &= F \
    Op(A)_1 e^(3t) f &= f \
    Op(A)_1 f &=  e^(-3t) f \
$

Now observe proposed solution  $f=e^(a t)$.

$ Op(A)_1 e^(a t) = dif/(dif t)e^(a t) + 3 e^(a t) = a e^(a t) + 3e^(a t) = (a+3)e^(a t) $

As such the the egienvalues ($lambda$) is all real numbers and the coresponding eigenfunction is $e^((lambda -3)t)$.

For $Op(A)_2$, I dont know...
$
    laplace { Op(A)_2 f } &= laplace { dif^2 /(dif t^2) f } \
    laplace { Op(A)_2 } F &= s^2 F - s f(0) - f'(0) \
    (laplace { Op(A)_2 } F) / s^2 &= F \
    Op(A)_2 f t &= f \
    Op(A)_2 f &= 1/t f
$

= Problem 1 C

$
    Op(A)_3 f(t) &= frac(dif^2, dif t^2) e^(-k t^2) - 4 k^2 t^2 e^(-k t^2) \
        &= frac(dif, dif t) (-2k t) e^(-k t^2) - 4 k^2 t^2 e^(-k t^2) \
        &= (-2k t)(-2k t) e^(-k t^2) + (-2k) e^(-k t^2)  - 4 k^2 t^2 e^(-k t^2) \ 
        &= (-2k) e^(-k t^2) + 4k^2 t^2e^(-k t^2) - 4 k^2 t^2 e^(-k t^2) \ 
        &= -2k f(t)
$

Therefore this is an eigenfunction with an eigenvalue of $-2k$.

#h(1fr) $ballot$

= Problem 2

Consider some mebers of the basis such that cos(ax) and cos(bx).

Then their scalar product is defined as

$ integral_(-pi)^(pi) cos(a x) cos(b x) dif x $ 
$ 1/2 integral_(-pi)^(pi) cos((a+b) x) + cos((a-b) x) dif x $ 

cosine is symetric over the domain of this integral. As such the integral is always 0 unless $a=b$ in which case the second term collapses as follows:

$ 1/2 integral_(-pi)^(pi) cos(2 a x) + cos(0) dif x $ 
$ 1/2 integral_(-pi)^(pi) 1 dif x = 2 pi / 2 = pi $ 


To make the basis orthonormal, each of the vectors must divided by its norm which is the square root of the inner product with itself.

As such the _orthonormal_ basis looks like:

$ {1/sqrt(pi), frac(cos(x), sqrt(pi)), frac(cos(2x), sqrt(pi)), ...} $

#h(1fr)
$ballot$

= Problem 3

Consider some mebers of the basis such that $x^a$ and $x^b$

Then their scalar product is defined as

$ integral_(0)^(1) x^a x^b $

$ integral_(0)^(1) x^(a+b) = frac(1, a+b+1) x^(a+b+1) |_0^1 = frac(1, a+b+1) $

For the trivial example of a is equal to 1 and b is equal to 2 the scalar
product is not 0. This means that the basis is not orthonormal.

It is however possible to construct a basis using the gram scmichmidt method.

The first state is trivial
$
    zeta_0 = psi_0 = 1
$

The next state requires first calculating some inner products to use in the projections:
$
    ip(psi_1, zeta_0) &= integral_0^1 x dot 1 dif x = 1/2 x^2 |_0^1 = 1/2 \
    ip(zeta_0, zeta_0) &= integral_0^1 1 dot 1 dif x = x |_0^1 = 1 \
    zeta_1 &= psi_1 - frac(ip(psi_1, zeta_0), ip(zeta_0, zeta_0)) psi_1 = x - frac(1/2, 1) x = 1/2 x
$

The next projections requires more 
$
    ip(psi_2, zeta_0) &= integral_0^1 x^2 dot 1 dif x = eval(1/3 x^3)_0^1 = 1/3 \ 
    ip(psi_2, zeta_1) &= integral_0^1 x^2 dot 1/2 x dif x = eval(1/8 x^4)_0^1 = 1/8 \
    ip(zeta_1, zeta_1) &= integral_0^1 1/2 x dot 1/2 x dif x = eval(1/12 x^3)_0^1 = 1/12 \
    zeta_2 &= psi_2 - proj(psi_2, zeta_0) psi_1 - proj(psi_2, zeta_1) psi_2  = x^2 - frac(1/3, 1) x - frac(1/8, 1/12) x^2 \
    zeta_2 &= x^2 - 1/3 x - 3/2 x^2  -1/2 x^2 - 1/3 x
$

Complexity scales...

$
    ip(psi_3, zeta_0) &= integral_0^1 x^3 dot 1 dif x = eval(1/4 x^4)_0^1 = 1/4 \
    ip(psi_3, zeta_1) &= integral_0^1 x^3 dot 1/2 x dif x = eval(1/10 x^5)_0^1 = 1/10 \
    ip(psi_3, zeta_2) &= integral_0^1 x^3 dot (-1/2 x^2 - 1/3 x) dif x \
                      &= integral_0^1 -1/2 x^5 - 1/3 x^4 dif x = eval(-1/12 x^6 -1/15 x^5 )_0^1 = -1/12 - 1/15 = -3/20 \

    ip(zeta_2, zeta_2) &= integral_0^1 ( -1/2 x^2 - 1/3 x) dot ( -1/2 x^2 - 1/3 x ) dif x \
        &= integral_0^1 ( 1/4 x^4 + 1/3 x^3 + 1/9 x^2 ) dif x \
    &= eval(1/20 x^5 + 1/12 x^4 + 1/27 x^3 )_0^1  = 1/20 + 1/12  + 1/27 = 23/135 \
$

Now we can use these to find another orthogonal vector.
$
    zeta_3 &= psi_3 - proj(psi_3, zeta_0) psi_1 - proj(psi_3, zeta_1) psi_2 - proj(psi_3, zeta_2) psi_3 \ 
    zeta_3 &= x^3 - frac(1/4, 1) x - frac(1/10, 1/12) x^2 - frac(-3/20, 23/135) x^3  \
    zeta_3 &= x^3 - 1/4 x - 6/5 x^2 + 405/460 x^3  \
    zeta_3 &= 173/92 x^3 - 6/5 x^2 - 1/4 x  
 $


Thee process can be continued to create the full orthogonal basis. Such as:

$ {1, 1/2 x, -1/2 x^2 - 1/3 x, 173/92 x^3-6/5 x^2 - 1/4 x, ...} $

To normalize it, each must be divided by its norms seen in @the-norm which is the square root of
the inner product. The inner products have all but $norm(zeta_3)$ have been
calculated above:

$ zeta_i ' = frac(zeta_i, norm(zeta_i)) $ <the-norm>

$
    ip(zeta_3, zeta_3) &= integral_0^1 (173/92 x^3 - 6/5 x^2 - 1/4 x ) (173/92 x^3 - 6/5 x^2 - 1/4 x )  dif x \
    ip(zeta_3, zeta_3) &= integral_0^1 (29929/8464 x^6 - 2076/460 x^5 + 36/25 x^4 + 12/20 x^3 + 1/16 x^2 )  dif x \
    ip(zeta_3, zeta_3) &= eval( 29929/(7 dot 8464)x^7  - 2076/(460 dot 6)x^6 + 36/(25 dot 5)x^5 + 12/(20 dot 4)x^4 + 1/(16 dot 3)x^3 )_0^1 \
    ip(zeta_3, zeta_3) &= 0.211807
$


Now it is possible to compute the normalized value of each basis vector:

$

    zeta_0 ' &= frac(zeta_0, norm(zeta_0)) = frac(1, sqrt(1)) = 1 \
    zeta_1 ' &= frac(zeta_1, norm(zeta_1)) = frac(1/2 x, sqrt(1/12)) = 0.1443 x \
    zeta_2 ' &= frac(zeta_2, norm(zeta_2)) = frac(-1/2x^2 -1/3x, sqrt(23/135)) \
    zeta_2 ' &= -0.2063x^2 - 0.1376x \
    zeta_2 ' &= frac(zeta_3, norm(zeta_3)) = frac(173/92x^3-6/5x^2-1/4x, sqrt(0.211807)) \
    zeta_2 ' &= 0.8654x^3 - 0.5523x^2 - 0.1151x 
$

Thus, the orthonormal basis is:

$ {1, 0.1443 x, 0.2063 x^2 - 0.1376 x, 0.8654 x^3 - 0.5523 x^2 - 0.1151 x, ...} $

#h(1fr)
$ballot$


= Problem 4

An eigenfunction satisfies the condition $Op(A) psi = lambda psi$. By plugging
in each value and confirming it matches this form it is then an eigen value.

$
    Op(A)_0 psi_0 &= ip(psi_0, psi_0) psi_0 \
        &= 1 dot psi_0 \
    
    Op(A)_0 psi_1 &= ip(psi_0, psi_1) psi_0 \
        &= 0 dot psi_0 \

    Op(A)_1 psi_0 &= ip(psi_1, psi_0) psi_1 \
        &= 0 dot psi_1 \

    Op(A)_1 psi_1 &= ip(psi_1, psi_1) psi_1 \
        &= 1 dot psi_1 \
$

By using the above operations on the orthogonal basis it is possible to contruct
each row of the matricies based on the left hand side of the equation.
$
    Op(A)_0 = mat(1, 0; 0, 0) \
    Op(A)_1 = mat(0, 0; 0, 1) \
$

#h(1fr)
$ballot$

= Problem 5

The operator defined as:


$ accent(A, \^) psi = 1/sqrt(2) (alpha_0 + alpha_1)psi_0 - 1/sqrt(2) (alpha_0 - alpha_1) psi_1 $

can be expressed using a repersentative matrix.

$
    Op(A) = mat(1/sqrt(2), 1/sqrt(2); -1/sqrt(2), 1/sqrt(2);)
$

Now to find the eigenfunctions with matlab:
$
    lambda &= isq(2) plus.minus i isq(2) \
    phi &= isq(2) psi_0 plus.minus isq(2) psi_1
$

The eigenfunctions are orthogonal if the scalar product between them is 0 and 1
with themselves:

$
    ip(phi_1, phi_1) &= ip(isq(2) psi_0 - isq(2) psi_1, isq(2) psi_0 - isq(2) psi_1)\ 
        &= 1/2 ip(psi_0, psi_0) - 1/2 ip(psi_0, psi_1) - 1/2 ip(psi_1, psi_0) + 1/2 ip(psi_1, psi_1) \
        &= 1/2 - 0 - 0 + 1/2  = 1\
    ip(phi_0, phi_1) &= ip(isq(2) psi_0 + isq(2) psi_1, isq(2) psi_0 - isq(2) psi_1)\ 
        &= 1/2 ip(psi_0, psi_0) - 1/2 ip(psi_0, psi_1) + 1/2 ip(psi_1, psi_0) - 1/2 ip(psi_1, psi_1) \
        &= 1/2 - 0 + 0 - 1/2  = 0\
    ip(phi_0, phi_0) &= ip(isq(2) psi_0 + isq(2) psi_1, isq(2) psi_0 + isq(2) psi_1)\ 
        &= 1/2 ip(psi_0, psi_0) + 1/2 ip(psi_0, psi_1) + 1/2 ip(psi_1, psi_0) + 1/2 ip(psi_1, psi_1) \
        &= 1/2 + 0 + 0 + 1/2  = 1\
$

Observe the correct result

#h(1fr)
$ballot$

= Problem 6 A

$
    Psi &= psi_+ times.o psi_- \
    Psi &= (isq(2)psi_0 + isq(2)psi_1) times.o (isq(2)psi_0 - isq(2)psi_1) \
    Psi &= 1/2 Psi_(00) - 1/2 Psi_(01) + 1/2 Psi_(10) - 1/2 Psi_(11) \
$

The probability of each state is the square of coeficent or $1/2^2 = 1/4$.

#h(1fr)
$ballot$

= Problem 6 BC

To apply an operator $Op(W)$ to this state as follows:

$
    Op(W) Psi &= sqrt(2) ( Op(I) times.o Op(A)_0 - Op(A)_1 times.o Op(I) ) Psi \
        &= sqrt(2)/2 Op(W) (Psi_(00) - Psi_(01) + Psi_(10) - Psi_(11) ) \
    &= isq(2) lr([[
                (Op(I) times.o Op(A)_0)Psi_(00)
                -
                (Op(A)_1 times.o Op(I))Psi_(00)
            ]
            - 
            [
                (Op(I) times.o Op(A)_0)Psi_(01)
                -
                (Op(A)_1 times.o Op(I))Psi_(01)
            ]\
            +
            &[
                (Op(I) times.o Op(A)_0)Psi_(10)
                -
                (Op(A)_1 times.o Op(I))Psi_(10)
            ]
            - 
            [
                (Op(I) times.o Op(A)_0)Psi_(11)
                -
                (Op(A)_1 times.o Op(I))Psi_(11)
            ]
        ]) \

        &= isq(2) lr([[ Psi_(00) - (0 psi_1 times.o psi_0)]
            - [ (psi_0 times.o 0 psi_0) - (0 psi_1 times.o psi_1) ]
            + \ &[ Psi_(10) - Psi_(10) ] - [ (psi_1 times.o 0 psi_0) - Psi_(11) ]
        ]) \
        &= isq(2) lr([[ Psi_(00) - 0 ] - [ 0 - 0 ] + [ 0 ] - [ (0) - Psi_(11) ]]) \
        &= isq(2) lr([ Psi_(00) + Psi_(11) ])
$

This is one of the Bell states so it is not possible to repersent it as the
tensor of two quantum states.

As such it is repersented with this circuit:
#align(center)[#{
    quill.quantum-circuit(
        quill.lstick($psi_0$), $H$, quill.targ(1), quill.rstick($isq(2)(Psi_(00)+Psi_(11))$, n: 2), [\ ],
        quill.lstick($psi_0$), 1, quill.ctrl(), 1
    )
}]

#h(1fr) $ballot$

= Problem 6 D

Yet again, we can apply an different operator $Op(W)$ to this state as follows:

$
    Op(W) Psi &= sqrt(2) ( Op(A)_1 times.o Op(A)_0 - Op(A)_0 times.o Op(A)_1 ) Psi \
        &= sqrt(2)/2 Op(W) (Psi_(00) - Psi_(01) + Psi_(10) - Psi_(11) ) \
    &= isq(2) lr([[
                (Op(A)_1 times.o Op(A)_0)Psi_(00)
                -
                (Op(A)_0 times.o Op(A)_1)Psi_(00)
            ]
            - 
            [
                (Op(A)_1 times.o Op(A)_0)Psi_(01)
                -
                (Op(A)_0 times.o Op(A)_1)Psi_(01)
            ]\
            +
            &[
                (Op(A)_1 times.o Op(A)_0)Psi_(10)
                -
                (Op(A)_0 times.o Op(A)_1)Psi_(10)
            ]
            - 
            [
                (Op(A)_1 times.o Op(A)_0)Psi_(11)
                -
                (Op(A)_0 times.o Op(A)_1)Psi_(11)
            ]
        ]) \

        &= isq(2) lr([[ 0 - 0 ] - [ 0 - Psi_(01) ] + [ Psi_(10) - 0 ] - [ 0 - 0 ]]) \
        &= isq(2) lr([ Psi_(10) - Psi_(01) ])
$

This is yet again one of the Bell states so it cannot be repersented as the
tensor of two quantum states and its circuit is well known:

#align(center)[#{
    quill.quantum-circuit(
        quill.lstick($psi_0$), $Op(H)$, quill.targ(1), quill.rstick($isq(2)(Psi_(10)-Psi_(01))$, n: 2), [\ ],
        quill.lstick($psi_0$), $Op(X)$, quill.ctrl(), 1, 
    )
}]

#h(1fr) $ballot$

// Local Variables:
// typst-preview--master-file: "/home/focus/dev/sagan/labs/elen162-hw2.typ"
// End:
