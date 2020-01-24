// WARNING: Turn down the volume or wear headphones
// Direct sound
adc => Gain input => dac;
1.0 => input.gain;

//Delay lines to model walls + floor/ceiling
input => Delay d1 => dac;
input => Delay d2 => dac;
input => Delay d3 => dac;

// Hook delay lines back to themselves
d1 => OneZero lp1 => d1;
d2 => OneZero lp2 => d2;
d3 => OneZero lp3 => d3;

// Set feedback/loo on all delay lines
0.8 => d1.gain => d2.gain => d3.gain;

// Allocate memory and set delay lengths
0.06::second => d1.max => d1.delay;
0.08::second => d2.max => d2.delay;
0.10::second => d3.max => d3.delay;

// Enjoy the room you built!
while (1) {
    1.0::second => now;
}