// Author: Elohim Guevara
// Date: October 10, 2019
// patch name: vars_and_math.ck
// description: Learning to play with variables
// and doing math in patch.

// Sound chain 
TriOsc t => dac;
// Declare and initialize
// and integer variable
// called myPitch
310 => int myPitch;

1 => int onGain;
0 => int offGain;

// Play one note
myPitch => t.freq;
onGain => t.gain;
0.3::second => now;

// Turns off the sound of my 
// oscillator to separate the notes
offGain => t.gain;
0.3::second => now;
// Mutiply pitch by 2
1 *=> myPitch;
// Play another note, with higher pitch
myPitch => t.freq;
onGain => t.gain;
0.3::second => now;
// Turn off the sound of my oscillator
offGain => t.gain;
0.3::second => now;
