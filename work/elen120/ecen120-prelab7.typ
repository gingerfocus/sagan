#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ECEN120 - Prelab 7", columns: 1, author: "Evan Stokdyk")

// Textbook: Chapter 20 & 21

= Problem 1
_What are the deliverable in lab 7_.

In this lab, we will build a circuit using a DAC and ADC. The configurations are
provided by a reference document and assembly to interact with it must be
written. In part 2, we then use a DAC to create a 20kHz sin wave using a timer.
Problem 3 and 4 have us making change to the code to better learn how the
hardware works.

= Problem 2
_Determine what value will be returned by the A/D converter when the input from
the potentiometer is exactly 1.5V_.

The ADC reads a value from 0 to 3 volts so a value of 1.5 volts will be read as
half of the max {12{1}}>>1.

Thus, the value returned will be {11{1}} or 4095.

= Problem 3
_If the sample output rate is 20KHz, and the sine-wave output frequency is
600Hz, how much does the phase need to be incremented for each sample?_

To have a 600Hz output frequency we need to divide the sample frequency by the
output frequency:

$ frac(2 pi dot 600, 20000) = 0.18849555921 $

Thus each cyle we must increment the t value that goes into sine by about 0.19.

