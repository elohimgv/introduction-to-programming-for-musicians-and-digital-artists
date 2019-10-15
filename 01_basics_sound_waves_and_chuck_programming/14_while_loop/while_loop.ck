// Author: Elohim Guevara
// Date: October 15, 2019
// patch name: while_loop.ck
// description: learning how to use
// an while loop.

// Sound signal chain
SawOsc saw => dac;

// Initialize variable i
30 => int i;
// while loop (instead of for loop)
while (i < 400) {
    <<< i >>>;
    i => saw.freq;
    // Advance time
    10::ms => now;
    i++; // Update counter
}