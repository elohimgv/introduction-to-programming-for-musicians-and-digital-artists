/*
* "Plucked string with noise"
*/

// Noise fed to Delay
Noise pluck => Delay str => dac;

// Loop back and forth by itself
str => str;

// Time to implement the Delay
600::samp => str.delay;

// Wave slight losses
0.98 => str.gain; // High losing-low gain and low losing-high gain

// Gate (switch on) the output of the Noise UGen 
// to exite the delay line string when you pluck, 
// then shut off the noise a very short period.
1.0 => pluck.gain; // Set volume to pluck
400::samp => now;

// Shut off the noise generator
0.0 => pluck.gain;

// Wait 5 seconds while the sound is synthesizing
second*5 => now;