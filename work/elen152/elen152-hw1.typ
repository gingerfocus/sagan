#import "@local/pset:0.1.0" as pset: prove, find
#import "@preview/lilaq:0.6.0" as lq

#show: pset.ieee.with(title: "ELEN152 - Homework 1", columns: 1, author: "Evan Stokdyk")
#show link: set text(fill: blue)
// #set text(16pt)

= Problem 1.02
#find[The distance between dopants with the concentration $10^14 "cm"^(-3)$.]

Given that we space the dopants out evenly, there is no need to involve any of
the structure of silicon as this can just be calculated directly.

This is done by finding the average space around a given dopant which is the
inverse of the concentration. Then to turn that volume into linear distance you
can take the cube root:

$
  d &= root(3, 1/N_a) \
  d &= root(3, 1/10^14) \
  d &= root(3, 10^(-14)) \
  d &= 2.1544 dot 10^(-5) "cm" \
  d &= 215.4 "nm"
$

#find[If the concentration is $10^18 "cm"^(-3)$.]

This is done the same as above:
$
  d &= root(3, 1/10^18) \
  d &= root(3, 10^(-18)) \
  d &= 10^(-6) "cm" \
  d &= 10 "nm"
$

#find[If the concentration is $5 dot 10^20 "cm"^(-3)$.]

Again the same as above:
$
  d &= root(3, 1/(5 dot 10^20)) \
  d &= 1.259 dot 10^(-7) "cm" \
  d &= 10 "nm"
$

= Problem 1.04
#find[The resistivity of pure silicon in ohm cm at room temperature.]

Resistivity is modeled by the following equation:
$ rho = 1/(q dot n_n dot mu_n + q dot n_p dot mu_p) \ $

This is pure silicon so the number of holes and charges are the same and thus
we can rewrite this as:
$
  rho = 1/(q dot n_i (mu_n + mu_p)) \
$

We neglect the carrier mobility may change with temperature and so the only thing
to change is the number of intrinsic carriers.

Finding the value of $n_i$ is very hard but can be done as follows:

$
  n_i^2 = N_c N_v e^(-E_g / (k T)) \
  n_i = sqrt(N_c N_v) e^(-E_g / (2 k T)) \
$

We can plug in constants, assuming that $N_c$ and $N_v$ are much more weekly
coupled to $T$ than the other term is ($N_(c,v) prop T^(3/2)$). In addition,
the band gap will also change with temperature but it is not relevant:
$
  n_i &= sqrt(2.8 dot 10^19 dot 1.8 dot 10^19) dot e^(-1.12 / (2 (8.617 dot 10^(-5)) T)) \
  n_i &= 2.2449 dot 10^19  e^(-6.49 dot 10^3 / T)
$

We can now plug in the room temperature value of 300K:
$
  n_i &= 2.2449 dot 10^19 e^(-6.49 dot 10^3 / 300)
  n_i &= 9.03566 dot 10^9
$

This is wrong and I dont know how to fix it...

#find[The resistivity of pure silicon in ohm cm at 100K.]

TODO

#find[The resistivity of pure silicon in ohm cm at 1000C.]

TODO

= Problem 1.07
#find[
  Show that $E_f$ is approximately in the middle of the band gap for intrinsic
  silicon.
]

In intrinsic silicon, the number of charge carriers and holes must be equal.
We can then sub in equation for these and try to solve for the Fermi level:
$
  n_n &= n_p \
  N_c e^( -(E_c - E_f)/(k T) ) &= N_v e^( -(E_f - E_v)/(k T) ) \
  N_c / N_v &= e^( -(E_f - E_v)/(k T) ) / e ^( -(E_c - E_f)/(k T) ) \
  N_c / N_v &= e^((-(E_f - E_v) + (E_c - E_f))/(k T) ) \
  ln(N_c / N_v) &= (-(E_f - E_v) + (E_c - E_f))/(k T) \
  k T ln(N_c / N_v) &= -E_f + E_v + E_c - E_f \
  2 E_f  &= E_v + E_c - k T ln(N_c / N_v) \
  E_f &= (E_v + E_c)/2 - (k T)/2 ln(N_c / N_v) \
  E_f &= (E_v + E_c)/2 - (k T)/2 ln(N_c / N_v) \
$

Thus, the Fermi level is the center of the band gap minus some small error term.

= Problem 1.11
#find[
  The Maxwell-Boltzmann distribution is often used to approximate the
  Fermi-Dirac distribution function. On the same set of axes, sketch both
  distributions as a function of $(E - E_f)/(k T)$. Consider only positive
  values. When is the estimation error within 10%.
]

The Fermi-Dirac distribution is as follows:
$ f(E) = 1/(1 + e^((E - E_f) / k T)) $


I found the Maxwell-Boltzmann distribution
#link("https://en.wikipedia.org/wiki/Maxwell%E2%80%93Boltzmann_statistics")[here]
which is written as:
$ N_i = g_i/(e^((epsilon_i - mu) / k_B T)) $

It is easy to parameterize each as in the question:
$
  f(x) &= 1/(1+e^x) \
  m(x) &= 1/e^x
$

This gives the data shown in @distributions-graph.

#let samples = 10
#let data = 31

// * 0.5
#let maxwellbolzmann(i) = { return 1 / calc.exp(i/samples) }
#let fermidirac(i) = { return 1 / (1+calc.exp(i/samples)) }
#let estimationerror(i) = {
  let expected = fermidirac(i)
  let acutal = maxwellbolzmann(i)
  return (acutal - expected) / expected
}

#figure(
  lq.diagram(
    width: 12cm,
    height: 8cm,
    xlabel: $(E - E_f)/(k T)$,
    ylabel: $f(E)$,
    lq.plot(
      range(data).map(i => i/samples), range(data).map(maxwellbolzmann),
      smooth: true,
      label: [Maxwell-Boltzmann],
      mark: none,
    ),
    lq.plot(
      range(data).map(i => i/samples), range(data).map(fermidirac),
      smooth: true,
      label: [Fermi-Dirac],
      mark: none,
    ),
    lq.plot(
      range(data).map(i => i/samples), range(data).map(estimationerror),
      smooth: true,
      label: [Estimation Error],
      mark: none,
    ),
  ),
  caption: [Comparing different distributions.]
) <distributions-graph>

Note, in @distributions-graph the Maxwell Boltzmann and the error are the same value so they one covers
the other. This then shows that the estimation error is less that 10% when the
values of $(E - E_f)/(k T)$ are above around $2.5$.


= Short Answer
#find[
  Moore claims there is "no fundamental obstacle" to achieving 100% device
  yield, and contrasts this with another kind of process limit. What is his
  reasoning, and what does he contrast it with?
]

Moore first states that at the present moment (1965) packaging has higher cost
so there is no need to increase yields. He talks about the potential by
contrasting it with chemical reactions stating that it needs to maintain
thermodynamic equilibrium. My understanding of his reasoning is that chemical
process are subtractive by converting between different compounds necessitating
some by products. However, fabrication is additive against the wafer. You never
are required to reduce the size of the wafer.

#find[
  Moore predicted that the cost-minimum complexity would reach ~65,000
  components per chip by 1975 by extrapolating a doubling-per-year trend.
  Evaluate this prediction against the historical record. Cite specific
  commercial chips and their transistor counts. Discuss why this prediction did
  or did not match reality.
]

Section 1.1 of the textbook makes the claim the Moore was correct in his
prediction. However, the Intel 8080 (1974) had a transistor count of 4500 which
is a significant departure from the number stated by Moore. It is possible it
is what caused him to revise his estimate down from doubling every year to 2
years later. Using the lower number as a baseline and then doubling creates the
following tables sampled from #link("https://en.wikipedia.org/wiki/Transistor_count")[here]:

#table(
  columns: 4,
  [year], [chip], [transistors], [increase], 
  [1982], [Intel 80186], [55000], [12],
  [1989], [Intel 80486], [1.1M], [20],
  [2000], [Intel Pentium 4], [42M], [38],
  [2010], [Intel i7], [1.2B], [28],
  [2021], [Apple M1 Max], [57B], [47],
)

Even given the shorter time frame (8 vs 10 years), the scaling was still low
before the mid 80s. It appears as if Moore's prediction was an overestimate for
the first 20 years before becoming very accurate.

The tighter conformance to the scaling could be due to industry targets set
based on these very numbers. I think the prediction could have failed as the
paper mentions presently (1965) low yields in fabrication so it could be that
tooling existed to create an IC of that scale but the yield was not high enough
to justify a mass market device.


