#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "MATH190 - Homework 2", columns: 1, author: "Evan Stokdyk")
// #set text(16pt)

#show math.equation: set block(breakable: true)

= Problem 1
No solution found.

= Problem 2
No solution found.

= Problem 3
No solution found.

= Problem 4
#find[All positive integer solutions to $x^3 + 2y^3 = 4z^3$.]

First, consider the problem mod 9:
$ a^3 in {-1, 1, 0} (mod 9) $

Which by looking at the scaling of these values shows there is no construction
where the values are not 0.

As such all numbers are divisible by 9 which means we can rewrite the problem
as such:
$
  (9a)^3 + 2(9b)^3 &= 4(9c)^3 \
  9^3 ( a^3 + 2b^3 ) &= 9^3 4c^3
$

This however is the same problem as before the argument can be repeated.
Therefore, it is always possible to remove a factor of 9 from the number which
means that it can't be finite. As such there are no positive integer solutions
to this problem.

#h(1fr) $ballot$

= Problem 5
No solution found.

= Reading Summary
== Problem 75
#prove[
  If $(1 - 0.1^100) lt.eq x lt 1$ then so is $sqrt(x)$.
]

When a number is less than 1, its square root brings it closer to 1 thus:
$sqrt(x) > x$ which means it must also satisfy the condition.

#h(1fr) $ballot$

== Solution
I misunderstood the problem statement. I think this is a lesson to check when a
problem feels too easy. The solution however uses the same expression for the
initial value of $a$ so I think that I would have been able to get close.

== Problem 85
#prove[The sum of some concussive numbers is equal to 1000. Find these numbers.]

We can module the number as such:
$ dots (n-2)+(n-1)+n+(n+1)+(n-2) dots = (2k+1)n $

As such we must find the first odd number that divides 1000. Assuming we can't
use 1, the number is 5 so then:
$
  (200-2)+(200-1)+(200)+(200+1)+(200+2) = 5(200) = 1000
$

#h(1fr) $ballot$

== Solution
Yet again, I failed to read the problem and only found 2 solutions rather than
all of them. However, my approach would have worked and found all the
solutions. The books solutions I think is much less clear as it kinda hids
where the solution is coming from.

= Sources
None.
