// Author: Elohim Guevara
// Date: October 23, 2019
// patch name: math_random_music.ck
// description: Playing with random 
// numbers. Integers and float values.

// Sound signal chain
SqrOsc s => dac;

// Make a SqrOsc to play random notes
for (0 => int i; i < 16; i++) { // for loop plays 16 notes
    // Random integer note
    Math.random2(48, 72) => int myNote;
    // Random gain 
    Math.random2f(0.05, 0.9) => float myGain;
    // Prints current note and gain
    <<< myNote, myGain >>>;
    // Sets oscillators frequency and gain.
    Std.mtof(myNote) => s.freq;
    myGain => s.gain;
    // Let's each note sound for 1/5 second
    0.2::second => now;
}