#import "@local/pset:0.1.0" as pset: find, prove
#show: pset.ieee.with(title: "ELEN110 - Lab 3", columns: 1, author: "Evan Stokdyk")
#show raw: set text(10pt)

#let laplace = scale(120%, $cal(L)$)

= Question 1
#prove[ $ laplace [ t e^(a t) ] = 1/(s-a)^2 $.]

$
  laplace [ t e^(a t) ] &= laplace [ t ]_(s -> (s-a)) \
  laplace [ t e^(a t) ] &= (1/s^2)_(s -> (s-a)) \
  laplace [ t e^(a t) ] &= 1/(s-a)^2
$

#h(1fr) $ballot$

= Question 2
#find[An equation for figure P7.2 in the textbook and its laplace.]

Figure P7.2 is a graph that can be repersented by the following peicewise function.
$
  f(t) := cases(
    0  "if" t < 0,
    5t "if" 0 < t < 2,
    -5 "if" 2 < t < 4,
    0  "if" 4 < t
  )
$

This can alternativly be written as the following function:
$ f(t) = 5t [ u(t) - u(t-2) ] - 5[ u(t-2) - u(t-4) ] $

It is now possible to just take the laplace:
$
  F(s) &= laplace { 5t [ u(t) - u(t-2) ] - 5[ u(t-2) - u(t-4) ] } \
  F(s) &= 5 laplace { t [ u(t) - u(t-2) ] - u(t-2) + u(t-4) } \
  F(s) &= 5 [ laplace { t [ u(t) - u(t-2) ] } - laplace {(t-2)} + laplace {u(t-4)} ] \
  F(s) &= 5 [ laplace { t u(t) - t u(t-2) } - e^(-2s) + e^(-4s) ] \
  F(s) &= 5 [ 1/s^2 - e^(-2s) 1/s^2 - e^(-2s) + e^(-4s) ] \
$

#h(1fr) $ballot$

= Question 3
#find[
  The laplace of $3t[u(t-1) - u(t-3)]$.
]

$
  laplace { 3t[u(t-1) - u(t-3) ]} &= laplace { 3t u(t-1) } - laplace { 3t u(t-3) } \
    &= 3 e^(-s) laplace { t  } - 3 e^(-3s) laplace { t } \
    &= 3 e^(-s) 1/s^2 - 3 e^(-3s) 1/s^2 \
    &= 3 e^(-s)/s^2 - 3 e^(-3s)/s^2 \
$

#h(1fr) $ballot$

= Question 4
#find[The inital value of $v(0^+)$ of $ V(s) = (s+3)/(s(s+2)) $]

Using the Initial Value Theorem:
$
  v(0^+) &= lim_(s -> oo) s V(s) \
  v(0^+) &= lim_(s -> oo) s dot (s+3)/(s(s+2)) \
  v(0^+) &= lim_(s -> oo) (s+3)/(s+2) \
  v(0^+) &= lim_(s -> oo) 1/1 = 1 \
$

#find[The final value of $v(t)$.]

Using the Final Value Theorem:
$
  v(oo) &= lim_(s -> 0) s V(s) \
  v(oo) &= lim_(s -> 0) s dot (s+3)/(s(s+2)) \
  v(oo) &= lim_(s -> 0) (s+3)/(s+2) = 3/2
$

#h(1fr) $ballot$
