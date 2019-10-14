// Author: Elohim Guevara
// Date: October 14, 2019
// patch name: if_statement.ck
// description: learning how to use
// an if statement.

// Sound chain
SinOsc s => dac;

// Notes duration
1.5 => float tempo_pitch1;
1 => int tempo_pitch2;
tempo_pitch1::second => dur pitch1;
tempo_pitch2::second => dur pitch2;

// Set frequency
210.0 => s.freq;
// Set volume
0.6 => s.gain;
// Chance logical variable
1 => int chance;
<<< "value: ",chance >>>;

if (chance == 1) {
    // Sound will play only if chance == 1
    // Advanced time
    pitch1 => now;
}

// set frequency
335 => s.freq;
// Advanced time
pitch2 => now;