// Sound network
SinOsc chord[3]; // Three oscillators for a chord

for (0 => int i; i < chord.cap(); i++) {
    // Connect each element of our array to dac
    chord[i] => dac;
    
    // Adjust again so we don't overload
    1.0/chord.cap() => chord[i].gain;
}

fun void playChord(int root, string quality, dur howLong) {
    // Set root of chord
    Std.mtof(root) => chord[0].freq;
    
    // Set fifth of chord
    Std.mtof(root+7) => chord[2].freq;
    
    // Third sets quality, major or minor
    if (quality == "major") {
        Std.mtof(root+4) => chord[1].freq;
    } else if (quality == "minor") {
        Std.mtof(root+3) => chord[1].freq;
    } else {
        <<<"You must specify major or minor">>>;
    }
    howLong => now;
}

while (true) {
    playChord(Std.rand2(70, 82), "minor", second/2);
    playChord(60, "minor", second/2);
    playChord(67, "major", second/2);
}