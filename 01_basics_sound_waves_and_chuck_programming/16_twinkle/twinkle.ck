// Twinkle, with two oscillators!
SinOsc s => dac;
TriOsc t => dac;

// Our main pitch variable
110.0 => float melody;

// Gain control for our triangle wave melody
0.3 => float onGain;
// We'll use this for our on and off times
0.3::second => dur myDur;

// Only play t at first, sweeping pitch upward
onGain => t.gain;
0 => s.gain;
while (melody < 220.0) {
    melody => t.freq;
    1.0 +=> melody;
    0.01::second => now;
}

// Turn both on, set up pitches
0.7 => s.gain;
110 => s.freq;

// Play two notes, 1st "Twinkle"
for (0 => int i; i < 2; i++) {
    onGain => t.gain;
    myDur => now;
    0 => t.gain;
    myDur => now;
}

// New pitches!
138.6 => s.freq;
1.5 * melody => t.freq;

// Two more notes, 2nd, "Twinkle"
for (0 => int i; i < 2; i++) {
    onGain => t.gain;
    myDur => now;
    0 => t.gain;
    myDur => now;
}

// Pitches for "little"
146.8 => s.freq;
1.6837 * melody => t.freq;

// Play 2 notes for "little"
for (0 => int i; i < 2; i++) {
    onGain => t.gain;
    myDur => now;
    0 => t.gain;
    myDur => now;
}

// Set up and play "star!"
138.6 => s.freq;
1.5 * melody => t.freq;

onGain => t.gain;
second => now;

// End by sweeping both oscillators down to zero
for (330 => int i; i > 0; i--) {
    i => t.freq;
    i * 1.333 => s.freq;
    0.01::second => now;
}