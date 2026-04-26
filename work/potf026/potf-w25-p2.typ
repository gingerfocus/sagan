#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "POTF - W25 - Problem 2", columns: 1, author: "Evan Stokdyk")

#set text(16pt)

*Problem.* Suppose $sum_(n=1)^infinity a_n$ is an is a convergent series of positive
real numbers. Prove that the series

$ sum_(n=1)^infinity (a_n)^(n/(n+1)) $ 

converges.

*Answer.* Let $sum_(n=1)^infinity a_n$ be a a convergent series of positive real
 numbers.

Then, by the nth-term test:

$ display(lim_(n arrow.r infinity) a_n = 0) $

By using the defination of the limit:
$ exists k in NN |a_k-0| < epsilon $

Allow $epsilon$ to be 1 and using the value of k create a new sum in two
sections:

$ sum_(n=1)^infinity (a_n)^(n/(n+1)) = sum_(n=1)^k (a_n)^(n/(n+1)) + sum_(n=k)^infinity (a_n)^(n/(n+1)) $ <finite-sum>

You can see that in @finite-sum, the first term is a finite sum so it is simply equal to some constant value.

Based on our chosen k, we garentee that all $a_n < 1$ when $n>k$. For values of
$n>0$ the term in the exponent is greater that $1/2$. This means that the value $(a_n)^(n/(n+1)) lt.eq (a_n)^(1/2) $

This means that we can place a bound on the entire series.

$ sum_(n=k)^infinity (a_n)^(n/(n+1)) lt.eq sum_(n=k)^infinity (a_n)^(1/2) $

If this upper bound on the series conveges then the original series converges.

This can be shown using the Ratio Test:

$ frac((a_(n+1))^(1/2) , (a_(n))^(1/2) ) < 1 $

$ (frac(a_(n+1), a_(n)))^(1/2) < 1 $

$ frac(a_(n+1), a_(n)) < 1 $

This statement must be true as original series converges.

Therefore, the new series can be repersented as a constant plus a value that is
less that some other converging series. Therefore, the whole series must converge.

#h(1fr) $ballot$

This doesnt work as the counter example of the sum $a_n = 1/n^2$ does not coverge.

In short the problem lies in the fact that the ratio test is not Bi-implicitive
and the orignal seires could be in the undetermined state.

can i show that:
$ (a_n)^(n/(n+1)) lt.eq 2a_n $
$ (a_n)^(-1/(n+1)) lt.eq 2 $
$ 1/sqrt^(n+1)(a_n) lt.eq 2 $

