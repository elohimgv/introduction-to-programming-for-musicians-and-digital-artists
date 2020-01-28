// Homage to a classic analog synth sound
Moog mog => dac;

// Table of pitches to use
[77, 72, 69, 75, 70, 67, 74, 70, 65, 72] @=> int cars[];

// Play first note
play(cars[0], 0.25);
// Then play most of the rest
for (1 => int i; i < cars.cap()-1; i++) {
    if (i % 3 == 0) play(cars[i], 0.5);
    else play(cars[i], 0.25);
}

// Push up "mod wheel" for last note
0.25 => mog.vibratoGain;
play(cars[cars.cap()-1], 1.0);

// Function to play notes on/off
fun void play(int note, float howLong) {
    Std.mtof(note) => mog.freq;
    1 => mog.noteOn;
    (howLong - 0.05)::second => now;
    1 => mog.noteOff;
    0.05::second => now;
}
