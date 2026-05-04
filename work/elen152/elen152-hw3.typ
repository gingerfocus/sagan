#import "@local/pset:0.1.0" as pset: prove, find
#show: pset.ieee.with(title: "ELEN152 - Homework 3", columns: 1, author: "Evan Stokdyk")
#set text(16pt)

= Problem 4.03
#find[
  If a MOS device will be more or less sensitive to sodium contamination as gate
  oxide thickness decreases.
]

The relevant equation here is equation (4.1) which is threshold voltage of the
transistor:
$
  V_"TH" = V_"FB" + 2 phi_f + sqrt(2 epsilon_S q N_A (2 phi_f))/(C_"ox") - (q Q_M)/C_"ox"
$ <threshold-voltage>

As you decrease the oxide thickness, its capacitance ($C_"ox"$) will go down.
This means that both fraction will get larger and so the result depends on if:
$
  q Q_M gt sqrt(2 epsilon_S q N_A (2 phi_f))
$ <oxide-inequality>

When the above is true, the gate becomes more sensitive and when not the game
becomes less sensitive. This of course depends on $Q_M$ which is the ion
concentration. In most real devices, I believe this is true which means the
threshold voltage will go down and the device will become more sensitive.

#find[
  As the gate oxide thickness decreases, what must be done to the substrate
  doping to maintain the same $V_"TH"$.
]

In @oxide-inequality, we see that the non-constant term on the other side is
$N_A$ which is the doping of the substrate. As such it must increase to that the
increased value of the last term in @threshold-voltage is balanced by a
similarly increased value of the middle term.

#h(1fr) #sym.ballot

= Problem 4.04
#find[
  The frozen-in point defects responsible for a Si carrier lifetime of 10ms.
]

Using the provided equation (4.2):
$
  tau_G = 1/(sigma v_"th" N_t)
$

We have the provided value for the carrier lifetime in the question and can use
well known estimates for the others to find $N_t$:
$
  tau_G &= 1/(sigma v_"th" N_t) \
  0.01 &= 1/(10^(-16) dot 10^7 N_t) = 1/(10^(-9) N_t) \
  N_t &= 1/(0.01 dot 10^(-9)) = 1/(10^(-11)) = 10^(11) "cm"^(-3)
$

#find[
  If the defects are neutral vacancies, at what temperature are they frozen-in?
]

Recalling information from last chapter, we can use equation (3.5) to solve for the
value of T that produces the desired vacancy density:
$
  C_(V^0)^*           &approx 2.31 dot 10^21 exp(- 1.08/(k T)) \
  10^(11)             &= 2.31 dot 10^21 exp(- 1.08/(8.617 dot 10^(-5) T)) \
  4.329 dot 10^(-11)  &= e^(-12533.4/T) \
  -23.86              &= -12533.4/T \
  T                   &= 525.3
$

Thus, these vacancies froze-in at about 525K.

#h(1fr) #sym.ballot

= Problem 4.14
#find[
  The yield using the Poisson and negative binomial model given a $1 "cm"^2$
  chip and defect of $1 "cm"^-2$. For both assume $C=2$.
]

From the problem statement, we can extract the values that $A_C = 1$, $D_0 = 1$
and $C = 2$. This can be plugged into equation (4.19) to get the Poisson
distribution yield:
$
  Y &= (1 - 1/C)^(C A_C D_0) \
    &= (1 - 1/2)^(2 dot 1 dot 1) \
    &= (1/2)^(2) = 1/4 = 0.25
$

The same values can also be plugged into equation (4.22) to get the yield from
the negative binomial:
$
  Y &= (1 + (A_C D_0)/C)^(-C) \
  Y &= (1 + (1 dot 1)/2)^(-2) \
  Y &= (1 + 1/2)^(-2) = 2^2/3^2 = 4/9 = 0.444
$

This notably predicts a much higher yield.

#find[
  The number of months it takes to reach 90% yield given that the defect density
  decreases by 25% each month.
]

We can rewrite the poison yield equations (4.19) to solve for a variable defect
density:
$
  Y &= (1 - 1/C)^(C A_C D) \
  log Y &= (C A_C D) log (1 - 1/C) \
  D &= (log Y)/(C A_C log (1 - 1/C)) \
  D &= (log 0.9)/(2 dot 1 log (1 - 1/2)) \
  D &= 0.076
$

Given, this desired defect density we can calculate how many months it will take
to get there given that each month reduces by 25%:
$
  D(t) &= D_0 (1 - 0.25)^t \
  0.076 &= 1 (0.75)^t \
  t &= log_0.75 0.076 \
  t &= 8.958
$

Thus, at the end of 9 months this process will have over 90 percent yield.

#find[
  The change in defect density for a process to go from 40% yield to 95% yield.
]

To find this value we need to find the ratio $D_1 / D_0$ by solving (4.19) twice:
$
  D_0 &= (log Y_0)/(C A_C log (1 - 1/C)) \
  D_1 &= (log Y_1)/(C A_C log (1 - 1/C)) \
$

We will divide these equations to first cancel common terms:
$
  D_1/D_0 &= ( (log Y_1)/(C A_C log (1 - 1/C)) ) / ( (log Y_0)/(C A_C log (1 - 1/C)) ) = (log Y_1) / (log Y_0) \
  D_1/D_0 &= (log 0.95) / (log 0.4) = 0.0559793 \
$

Thus, the final defect density is 5.5% of the initial.

#h(1fr) #sym.ballot

= Problem 4.16
#find[
  The optimal allocation of devices for a 300mm wafer that cost 2000 dollars for
  the whole process line. There is a $1 "cm"^2$ device that is sold for \$50 and
  $0.1 "cm"^2$ device that is sold for \$1. The defect density is $0.5 "cm"^(-2)$
]

For simplicity, I will assume that the devices can be tiled perfectly across
the wafer but in reality the larger device will likely have many less devices
than modeled.

$
  A &= pi r^2 = pi (D/2)^2
  A &= pi (30/2 "cm")^2
  A &= 225 pi "cm"^2
$

So the number of devices for each is
$
  n_0 &= A / A_"C, 0" \
  n_0 &= (225 pi) / 1 = 706 \
  n_1 &= A / A_"C, 1" \
  n_1 &= (225 pi) / 0.1 = 7068 \
$

We then must calculate the yield for each:
$
  Y_0 &= (1 - 1/C)^(C A_"C, 0" D_0) \
  Y_0 &= (1 - 1/2)^(2 dot 1 dot 0.5) \
  Y_0 &= (1/2)^1 = 1/2 = 0.5 \
  Y_1 &= (1 - 1/C)^(C A_"C, 1" D_0) \
  Y_1 &= (1 - 1/2)^(2 dot 0.1 dot 0.5) \
  Y_1 &= (1/2)^(0.1) = 0.933
$

We can then multiply these out to get the number of good devices:
$
  "devices"_0 &= n_0 dot Y_0 \
  "devices"_0 &= 706 dot 0.5 = 353 \
  "devices"_1 &= n_1 dot Y_1 \
  "devices"_1 &= 7068 dot 0.933 = 6594
$

We can now multiply these by the unit cost to get the total cost:
$
  "revenue"_0 &= "devices"_0 dot "sale"_0 \
  "revenue"_0 &= 353 dot 50 = \$ 17650 \
  "revenue"_1 &= "devices"_1 dot "sale"_1 \
  "revenue"_1 &= 6594 dot 1 = \$ 6594 \
$

At a cost of 2000 dollars per wafer, both options are profitable and creating the
larger devices is significantly more valuable. Even considering, that
it may not be possible to place as many devices as counted here on the wafer, both
values will still be well above 2000 and the first will be greater than the
second for any small decrease in number of devices.

#h(1fr) #sym.ballot

= Problem 4.20
#find[
  If a process is under control ($C_p > 1$ and $C_"pk" > 1$) if the temperature
  must be between 38 and 49 Celsius and it has a standard deviation of 2.
]

We can calculate $C_p$ and $C_"pk"$ as seen in equation (4.27):
$
  C_p &= (T_f - T_0)/(6 sigma) \
  C_p &= (49 - 38)/(6 dot 2) \
  C_p &= 11/12 \
  C_p &= 0.9167
$

And then:
$
  C_"pk" &= min{(T_f - overline(T))/(3 sigma), (overline(T) - T_0)/(3 sigma)} \
  C_"pk" &= min{(49 - 42)/(3 dot 2), (42 - 38)/(3 dot 2)} \
  C_"pk" &= min{7/6, 4/6} \
  C_"pk" &= 0.667
$

These values are not under control. The only way to increase $C_p$ is to
decrease $sigma$:
$
  C_p   &= (T_f - T_0)/(6 sigma) \
  1     &= (49 - 38)/(6 sigma) \
  sigma &= 11/6 \
  sigma &= 1.833
$

So $sigma$ must be at most 1.833 and from there we can do the same calculation to
find what median value the process must reach to be under control:

$
  C_"pk" &= min{(T_f - overline(T))/(3 sigma), (overline(T) - T_0)/(3 sigma)} \
  1 &= min{(49 - overline(T))/(3 dot 1.833), (overline(T) - 38)/(3 dot 1.833)} \
  5.5 &= 49 - overline(T) and 5.5 = overline(T) - 38 \
  overline(T) &= 49 - 5.5 and 5.5 + 38 = overline(T) \
  overline(T) &= 43.5 and 43.5 = overline(T) \
$

Thus, for this process to be back within control they must reduce the value of
$sigma$ by 8.3% to 1.833 and get the average at 43.5 #sym.degree C. If they
further reduced the standard deviation they could have less control over the
mean.

#h(1fr) #sym.ballot

= Newport: Semiconductor
*Explain why going from visible to DUV (266nm) improves small-particle
sensitivity*.

The transition to DUV from visible light means that you have a significantly
smaller wavelength and higher frequency. This leads to higher sensitivity to
about 55nm feature size by using special algorithms to further increase
sensitivity. The higher frequency makes the light interact with smaller
structures thus making them detectable.

= Inspecting Unpatterned Wafers
*Explain how blank wafer process qualification could be used to characterize D_0
(defect density) added at each step for yield modeling*.

Blank wafer qualification can be used to characterize defect density of
different process by getting a base line defect count in a wafer before the
process to inform how much was is added. In addition, you can run a process on a
bare wafer to know exactly what it does adds given no external factors. In
general, the more data points you measure, the more useful it is. This detection
can find buried oxides in the substrate and smaller defects which both can
become larger over many process. As such you can monitor these defects so you if
they become don't mis-attribute them to the wrong process.
