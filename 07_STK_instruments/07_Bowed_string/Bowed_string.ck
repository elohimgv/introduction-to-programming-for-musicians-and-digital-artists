// Sound chain (Bowed string physical model) 
Bowed viol => dac;

// Define a D Major scale (in MIDI note numbers)
[62, 64, 66, 67, 69, 71, 73, 74] @=> int scale[];

// Run through our scale one note at a time
for (0 => int i; i < scale.cap(); i++) {
    // Set frequency according to note number
    Std.mtof(scale[i]) => viol.freq;
    // Note on for a while, then note off
    1 => viol.noteOn;
    0.3::second => now;
    1 => viol.noteOff;
    0.1::second => now;
}

// Repeat last note with lots of vibrato
1 => viol.noteOn;
0.1 => viol.vibratoGain;
2.0::second => now;
0 => viol.noteOff;
0.2::second => now;
