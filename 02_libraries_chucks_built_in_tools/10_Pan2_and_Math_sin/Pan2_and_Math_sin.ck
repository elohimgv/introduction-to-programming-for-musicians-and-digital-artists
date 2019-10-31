// Author: Elohim Guevara
// Date: October 24, 2019
// patch name: Pan2_and_Math_sin.ck
// description: Including a Noise object 
// to hear white noise moves between left 
// and right, back and forth.

// Sound chain: white noise to Pan2 to dac
Noise n => Pan2 p => dac;

// Noise can sound quite loud
0.2 => n.gain;

// Ifinite loop
while (true) {
   // Oscillate pan between 1.0 and -1.0
    Math.sin(now/second) => p.pan;
    // Do it pretty often, to make it smooth
    ms => now;
} 