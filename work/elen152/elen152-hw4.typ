#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "ELEN152 - Homework 4", columns: 1, author: "Evan Stokdyk")
#set text(16pt)

= Problem 5.09
#find[
  NA=0.5
  min resoultuon is 500nm
  k_1 = 0.75
  k_2 = 0.5
  photresist is 0.7 um thick
  + want DOF for whole thing

  If the focal plane is at the bottom of the resist
  what wavelength

  does it exist/can you design for it?
]

TODO

#find[
  If the focal plane is in the middle of the resist then what wavelength works?
]

TODO

= Problem 5.10a
#find[
  ArF laser of 193nm light
  NA=0.9
  k_1 = 0.75
  k_2 = 0.3

  estimate the hgith variation teleracne on the wafer surface

  use DOF
]

TODO

= Problem 5.12
#find[
  beam current 1 nA
  v = 100 kV
  spot = 50nm x 50nm

  if resist requires 10mJ cm^(-2)

  how long will it take to expose a pixel
]

TODO

#find[
  How long it will take to do a whole 12 inch diameter wafer
]

TODO

From the results we can see it takes a long time and so this is why e beam tech is not used

= Problem 5.26
#find[
  Modern DUV can reach better efficencies by doing more bake time. What limits
  how much you might want to use this effect.
]

You will need a very large oven to hold the potentially many wafter you will hold

Also, even thiugh you can increase through put of the lithography you very much
decrease latency which could cause you to not learn that the machine is faulty
unitl it has processed many more wafers.

= Question 1:
An EUV photon has $lambda = 13.5 "nm"$ (a) Calculate the photon energy in eV and
joules. (b) For a dose of 20 mJ/cm², calculate the number of incident photons
per nm². (c) For a contact hole with a 20 nm diameter (area ≈ 314 nm²), how many
photons are incident on the entire contact?

= Question 2:
Figure 8 shows that LER goes down (better) with increasing dose. (a) Explain
physically why higher dose reduces LER. (b) Explain physically why higher dose
reduces throughput. (c) The paper shows a non-CAR metal-oxide resist achieving
better LER for small features at higher dose. Why would abandoning chemical
amplification improve resolution and LER, and why does it increase required
dose?

= Question 3:
An EUV scanner delivers 1 W of EUV power at the wafer plane. The exposure field
is 26 mm × 33 mm. A 300 mm wafer requires 80 fields, and the overhead per field
(stage motion, alignment, settling) is 0.5 s. (a) For a resist dose of 20
mJ/cm², calculate the exposure time per field and the throughput in wafers per
hour. (b) If 40 mJ/cm² is the dose needed for acceptable LER what is the
throughput in wafers per hour?
