// Let´s Twinkle with a square wave
SqrOsc s => dac;

// Gains to square our notes
0.7 => float onGain;
0.0 => float offGain;
// Declare and intialize array of MIDI notes
[57, 57, 64, 64, 66, 66, 64, 62, 62, 61, 61, 59, 59, 57] @=> int a[];

// Loop for length of array
for (0 => int i; i < a.cap(); i++) {
    <<<i, a[i]>>>;
    
    // Set frequency and gain to turn on our note
    Std.mtof(a[i]) => s.freq;
    onGain => s.gain;
    if (i==6 || i==13) {
        0.8::second => now;
    } else {
        0.3::second => now;
    }
    
    // Turn off our note ot separe from the next
    offGain => s.gain;
    0.2::second => now;
}