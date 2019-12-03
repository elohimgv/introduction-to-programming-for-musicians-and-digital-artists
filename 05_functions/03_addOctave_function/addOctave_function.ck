// Let's use addOctave for music

SinOsc s => dac; // Oscillator so you can hear addOctave function
60 => int myNote; // Initial note

fun int addOctave(int note) {
    int result;
    note + 12 => result;
    return result;
}

fun int interval(int note1, int note2) {
    note2 - note1 => int result;
    return result;
}

Std.mtof(myNote) => s.freq; // Plays initial note
second => now;

myNote => addOctave => Std.mtof => s.freq; // Plays one octave up
second => now;

// Main program, test and print
interval(60, 72) => int int1;
interval(67, 60) => int int2;

<<< int1, int2 >>>;