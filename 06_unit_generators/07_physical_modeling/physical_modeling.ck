// Super simple Karplus_Strong plucked string
Impulse imp => Delay str => dac; // impulse feeds a delay line
str => str; // loop the delay back into itself

// Round-trip string delay, 100 HZ at 44.1k SRATE
441.0::samp => str.delay;
// Set round-trip string gain to less than 1.0
0.98 => str.gain;
// "pluck" the string
1.0 => imp.next;
// let the string "ring" a bit
5.0::second => now;