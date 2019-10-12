// Author: Elohim Guevara
// Date: October 11, 2019
// patch name: twinkle_with_dur_vars.ck
// description: Making music using dur variables.

// Sound signal chain (network)
SqrOsc sqr => dac;

220.0 => float twinkle;
// Define note durations as variables
0.55::second => dur onDur;
0.05::second => dur offDur;

// Turn on or turn off the volume
1 => int onGain;
0 => int offGain;

// Play one note
twinkle => sqr.freq;
onGain => sqr.gain;
// Advanced time: waits while note sounds
onDur => now;

// Turn off the volume and sound
offGain => sqr.gain;
offDur => now;

// Next note frequency (pitch)
1.5 *=> twinkle;
// Play other note of 2nd "twinkle"
twinkle => sqr.freq;
onGain => sqr.gain;
onDur => now;
