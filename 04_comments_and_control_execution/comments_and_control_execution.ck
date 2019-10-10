// Author: Elohim Guevara
// Date: October 10, 2019
// make a sound chain ("patch")

// sound network
TriOsc s => dac;
// prints out 
<<< "Hello chuckiang coders!" >>>;
// set volume to 0.6
.6 => s.gain;
// set frequency to 220.0
220.0 => s.freq;
// advance time: play for 1 second
second => now;

// set volume to 0.5
0.5 => s.gain; 
// set frequency to 440
440 => s.freq; 
// advanced time: play for two seconds
2::second => now; 

// no sound is here
0.0 => s.gain; 
// advanced time: play for half of a second
0.5::second => now; 

// set volume to 0.5
0.4 => s.gain; 
// set frequency to 440
340 => s.freq; 
// advanced time: play for one an half seconds
1.5::second => now; 