// Author: Elohim Guevara
// Date: October 12, 2019
// patch name: working_with_dur.ck
// description: playing with native data type 
// 'dur'. The dur type holds a duration, which
// is a length of time, the space between two times.

// Sound sinal chain (network)
SqrOsc s => dac;

120 => int pitch;
// The duration of a quarter note 
// in music depends on the tempo, 
// often expressed in how many quarter-note
// durations happend per second, also called
// BPM (beats per minute). Here we´ve defined 
// a quarter note to be 0.8 seconds, meaning
// that our tempo is 75 BPM (60 seconds per
// minute / 0.8 seconds per beat = 75 beats per minute).
0.8::second => dur quarter; // quarter note duration

4::quarter => dur whole; // whole note made up of four quarter notes
// other form to make a whole note
//4 * quarter => dur whole; // whole note made up of four quarter notes
whole / 2 => dur half; // half note made up of a whole note
quarter / 2 => dur eigth; // eigth note made up of a quarter note

// Set frequency
pitch => s.freq;
// Advanced time
eigth => now;

