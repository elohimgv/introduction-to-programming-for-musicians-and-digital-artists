/* 
* "The simplest plucked string"
*
* The string (delay) guides the wave (impulse)
* back and forth along the string.
*/ 

// Impulse feed a delay line
Impulse imp => Delay str => dac;

// Loop the delay back into itself
str => str;

// Represent the slight losses
0.7 => imp.gain; // Set gain

// Some reasonable value for the round trip time.
// The period of oscillation of the string.
441::samp => str.delay; // Set delay time

// Put 1.0 on the next sample and then 0.0
// forever until you use the .next method
1.0 => imp.next;

// Advanced time
second => now;