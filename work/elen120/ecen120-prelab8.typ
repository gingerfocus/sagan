#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ECEN120 - Prelab 8", columns: 1, author: "Evan Stokdyk")

// Textbook: Chapter 14.9 & 17

= Problem 1

_Review register specifications and supplied code_.

The first thing the code does is configure the lcd for display. It does this by
enabling the clock, configures the 4 relevant pins in alternate mode. There are
delays in the configuration to allow the external controller to react to each
change. It then clears the lcd by storing 0s into the whole buffer.

Next, the keypad is configured by turning on the lcock and setting the
appropriate bits for the mode. Reading from the keypad is just reading from a
register clearing the top bits.

Setting data to the display envolves testing various attributes of the segments
display and builds up a register to write to the LCD. It clears the data data
from each register and writes partial data to 6 different registers.

= Problem 2

_Plan to write tests and code_.

There are 3 functions that need to be filled in for this lab, first is reading
from kpad, then formatting for both letters and numbers.

To test this code, we will use the debug feature within the keil IDE. By
stepping through the code is is possible to observe the input and output of
peripherals which is often the hardest part to debug. By observing where and
unexpected value arises, it is possible to zero in on where and error
origonates.



