// Better Karplus-Strong plucked string
Noise pluck => Delay str => dac;
// Hook string back into itself
str => str;
//str => OneZero filter => str; // more realistic sound

// Round-trip string delay, 100 HZ at 44.1o SRATE
441.0::samp => str.delay;
// Set round-trip string gain to less than 1.0
0.98 => str.gain;
// "pluck" the string for the right amount of time
1.0 => pluck.gain;
441.0::samp => now;
// Shut off the noise generator
0.0 => pluck.gain;
// let the string "ring" a bit
5.0::second => now;