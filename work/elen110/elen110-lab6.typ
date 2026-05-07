#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ELEN110 - Lab 6", columns: 1, author: "Evan Stokdyk")
#show raw: set text(10pt)

= Questions
#figure(caption: "Graph containing data for all parts")[
  #image("new.png"),
]

In the data, you can see that the graph is the same for the first two parts.
This shows that the two different ways to represent the system are identical.

For the part A & B function, I would guess that the rise time is a little less
than 1 second. The overshoot is about 20% and the setting time is about 3
seconds.

For part C, The transient characteristics are very different. There are various
trade-offs such as having a slower rise time but less overshoot. The setting
time is also faster. Overall, I would say it is better but from an engineering
perspective they both B and C have merits.

In Part D, the system is not stable. This is because there is not any transient
value so this Laplace function result in a cosine which is shown in the graph.
