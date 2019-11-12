// Let´s Twinkle with a square wave
SqrOsc s => dac;
// Gains to separate our notes
0.7 => float onGain;
0.0 => float offGain;
// Declare and initialize array of MIDI notes
[57, 57, 64, 64, 66, 66, 64, 62, 62, 61, 61, 59, 59, 57] @=> int myNotes[];
// Quarter note and half note durations
0.3::second => dur q;
0.8::second => dur h;
[q, q, q, q, q, q, h, q, q, q, q, q, q, h] @=> dur myDurs[];

// Loop for length fo array
for (0 => int i; i < myNotes.cap(); i++) {
    // Set frequency and gain to turn on our note
    Std.mtof(myNotes[i]) => s.freq;
    onGain => s.gain;
    myDurs[i] => now;
    
    // Turns off our note to separate from the next
    offGain => s.gain;
    0.2::second => now;
}