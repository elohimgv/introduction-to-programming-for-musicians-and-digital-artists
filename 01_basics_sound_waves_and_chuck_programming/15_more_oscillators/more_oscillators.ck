// Author: Elohim Guevara
// Date: October 15, 2019
// patch name: more_oscillators.ck
// description: Playin and working 
// with more oscillators.

// Connect two oscillators to the dac
SinOsc sin => dac;
SinOsc sin2 => dac;

// Set their frequencies and gains
225 => sin.freq;
1030 => sin2.freq;
0.5 => sin.gain;
0.5 => sin2.gain;

second => now;