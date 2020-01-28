// Sound chain (Modal Bar presets)
ModalBar bar => dac;

while (true) {
    // Pick a random object type
    Math.random2(0, 8) => bar.preset;
    // and random frequency
    Math.random2f(200.0, 1000.0) => bar.freq;
    // Then whack it!!
    1 => bar.noteOn;
    0.4::second => now;
}