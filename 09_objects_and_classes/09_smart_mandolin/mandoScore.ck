// Let's try all this out!! Make a MandoPlayer object
MandoPlayer m;

// And declare some data for chording and strumming
["G","C","G","D","D","D","D","G"] @=> string chords[];
[0.4,0.4,0.4,0.1,0.1,0.1,0.1,0.01] @=> float durs[];
[79,81,83] @=> int strums[];

// Counter to iterate through the arrays
0 => int i;
// Roll the basic chords, reading through the arrays
while (i < chords.cap()) {
    m.roll(chords[i], durs[i]::second);
    i++;
}

// Now strum a few notes
0 => i;
while (i < strums.cap()) {
    m.strum(strums[i++], 1.0::second);
}

// Then en up with a big open G chord
m.damp(1.0);
m.roll("G", 0.02::second);
2.0::second => now;

// Damp it to silence, letting it ring a little
m.damp(0.01);
1.0::second => now;
