// piano.ck
// Sound chain
Rhodey piano[4];
piano[0] => dac.left;
piano[1] => dac;
piano[2] => dac;
piano[3] => dac.right;

// Chord 2D array
[[53,57,60,64],[51,55,60,63]] @=> int chordz[][];

// Loop
while (true) {
    // Build first chord
    for (0 => int i; i < 4; i++) {
        Std.mtof(chordz[0][i]) => piano[i].freq;
        Math.random2f(0.3, 0.7) => piano[i].noteOn;
    }
    // Advance time
    1.0::second => now;
    // Build second chord
    for (0 => int i; i < 4; i++) {
        Math.mtof(chordz[1][i]) => piano[i].freq;
        Math.random2f(0.3,0.7) => piano[i].noteOn;
    }
    // Advance time
    1.4::second => now;
}