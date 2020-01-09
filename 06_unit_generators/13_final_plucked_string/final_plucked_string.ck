/*
* "Final plucked string: Karplus-Strong algorithm"
*
* Add filter in the string loop (delay line) to model 
* the fact that the losses experienced by the waves 
* traveling up and down the strings are frequency-
* dependent, where for each trip around the string, 
* high frequencies experience more losses than
* low frequencies.
*
* DelayL allow linear interpolation between samples
*/

// Network UGens
Noise nois => ADSR pluck => DelayL str => dac;

// Hook string back and forth by itself
str => OneZero lowPass => str;

// Set A D S R  noise envelope parameters
pluck.set(0.002::second, 0.002::second, 0.0, 0.01::second);;
// Play random notes forever
while (true) {
    Math.random2f(110.0, 440.0)::samp => str.delay;
    // Turn on note (pluck string) and wait a bit
    1 => pluck.keyOn;
    0.6::second => now;
}
