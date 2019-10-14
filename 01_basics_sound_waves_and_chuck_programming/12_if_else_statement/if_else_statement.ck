// Author: Elohim Guevara
// Date: October 14, 2019
// patch name: if/else_statement.ck
// description: learning how to use
// an if-else statement.

// Sound chain
TriOsc t => dac;

// Set frequency
220.0 => t.freq;
// Set volume
0.5 => t.gain;
// Chance logical variable
3 => int chance;
if (chance == 1) {
    // Play first "twinkle" note if chance == 1
    1::second => now;
} else {
    // Otherwise, play other, higher twinkle note
    330.0 => t.freq;
    // and play it for a much longer time
    3::second => now;
} 

// Set and play one note, an octave above "twinkle"
440. => t.freq;
1::second => now;