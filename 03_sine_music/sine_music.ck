/* Sine music 
by Chuck programmer: Elohim Guevara
October 9, 2019
*/

SinOsc s => dac;

// Play one note
220 => s.freq;
1.0 => s.gain;
0.3::second => now;

// Sine oscillator silent
// for 0.3 seconds
0.0 => s.gain;
0.3::second => now;

// Play another note, same pitch
1.0 => s.gain;
0.3::second => now;

// Sine oscillator silent
// for 0.3 seconds
0.0 => s.gain;
0.3::second => now;

// Play two more notes, higher, less loud
335 => s.freq;
0.3 => s.gain;
0.3::second => now;
0.0 => s.gain;
<<<"gain: ", s.gain() >>>;
0.3::second => now;
0.3 => s.gain;
<<<"gain: ", s.gain() >>>;
0.3::second => now;
0.0 => s.gain;
<<<"gain: ", s.gain() >>>;
0.3::second => now;




