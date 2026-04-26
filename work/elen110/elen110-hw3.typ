#import "@local/pset:0.1.0" as pset: find
#show: pset.ieee.with(title: "ELEN110 - Lab 3", columns: 1, author: "Evan Stokdyk")
#show raw: set text(10pt)

= Question 1
#find[The impulse response when $h(t) = u(t)$ and $x(t) = t u(t)$.]

$
  y_a(t) &= x convolve h (t) \
    &= integral_0^oo x(tau) h(t - tau) dif tau \
    &= integral_0^oo tau u(tau) u(t - tau) dif tau \
    &= integral_0^t tau dif tau \
    &= 1/2 t^2
$

#find[Verify the above using $y(t) = integral_(-oo)^t x(tau) dif tau$.]
$
  y(t) &= integral_(-oo)^t x(tau) dif tau \
  y(t) &= integral_(-oo)^t tau u(tau) dif tau \
  y(t) &= integral_0^t tau dif tau \
  y(t) &= 1/2 t^2 \
$

These are the same.

#h(1fr) $ballot$

= Question 2
#find[
  The system output to the signal $x(t) = e^-t u(t)$ and $h(t) = u(t-1) -
  u(t-3)$.
]

This is the output:
$
  y(t) &= x convolve h(t) \
    &= integral_0^oo x(tau) h(t - tau) dif tau \
    &= integral_0^oo e^-tau u(tau) (u(t - tau - 1) - u(t - tau - 3) dif tau \
    &= integral_0^oo e^-tau u(t - tau - 1) - u(t - tau - 3 dif tau \
    &= integral_0^oo e^-tau u(t - tau - 1) dif tau - integral_0^oo e^-tau  u(t - tau - 3) dif tau \
    &= integral_0^(t-1) e^-tau dif tau - integral_0^(t-3) e^-tau dif tau \
    &= -e^-tau |_0^(t-1) + e^-tau |_0^(t-3) \
    &= -e^-(t-1) + e^0 + e^-(t-3) - e^0 \
    &= e^(3-t) - e^(1-t) \
$

#h(1fr) $ballot$

= Question 3
We are trying to find:
$ y(t) = x convolve h_1 convolve h_2 (t) $

Then,
$
  x convolve h_1 (t)
    &= integral_0^oo x(tau) h_1(t - tau) dif tau \
    &= integral_0^oo delta(tau) e^(t - tau) u(t - tau) dif tau \
    &= delta(0) e^(t - 0) u(t - 0) \
    &= e^t u(t) \
$

We can convolve again:
$
  y(t) &= x convolve h_1 convolve h_2 (t) \
    &= integral_0^oo x convolve h_1(tau) h_2(t - tau) dif tau \
    &= integral_0^oo e^tau u(tau) e^(t - tau) u(t - tau) dif tau \
    &= integral_0^t e^tau e^(t - tau) dif tau \
    &= integral_0^t e^tau e^t e^(-tau) dif tau \
    &= integral_0^t e^t dif tau \
    &= t dot e^t \
$

#h(1fr) $ballot$

= Question 4
No solution found.

= Question 5
#find[
  If the impluse response of $h(t) = u(t-1)/t^2$ is BIBO stable.
]
$
  delta(t) convolve h(t) &= integral_(-oo)^(oo) delta(tau) u(t-1-tau)/(t-tau)^2 dif tau \
    &= integral_0^(oo) u(t-1-tau) 1/(t-tau)^2 dif tau \
    &= integral_0^(t-1) (t-tau)^(-2) dif tau \
    &= ( 1/(t-tau) |_0^(t-1) \
    &= 1/(t-t+1) - 1/(t-0) \
    &= 1/1 - 1/t
    &= 1 - 1/t
$

This is not BIBO stable as on the domiain $[0, oo]$ the value at $t=0$ is not
bounded.

#h(1fr) $ballot$
