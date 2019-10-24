// Author: Elohim Guevara
// Date: October 24, 2019
// patch name: panning_1.ck
// description: Using .left and .right
// methods to hear from left to right
// speakers. And this is technique 1.

// Ugens oscillators connects to left and right channel
SinOsc s => dac.left;
SinOsc t => dac.right;

// Set frequencies
230 => s.freq;
361 => t.freq;

// Advance time
second => now;