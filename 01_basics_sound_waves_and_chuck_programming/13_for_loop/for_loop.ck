// Author: Elohim Guevara
// Date: October 14, 2019
// patch name: for_loop.ck
// description: learning how to use
// an for loop.

// Set up our patch
SawOsc sin => dac;

for (20 => int i; i < 800; i++) {
    // Print value of i
    <<< "Frequencies: ",i >>>;
    // Set frequency
    i => sin.freq;
    // Advance time
    10::ms => now;
}