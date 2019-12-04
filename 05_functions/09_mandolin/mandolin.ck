// Global variables
Mandolin mand => dac;
60 => int note;

// Functions
fun void noteUp() {
    1 +=> note; // note half-step up
    <<<note>>>; // print new note value
    play(); // call play function
}

fun void noteDown() {
    1 -=> note; // note half-step down
    <<<note>>>; // print new note value
    play(); // call play function
}

// play global note on global mand UG
fun void play() {
    Std.mtof(note) => mand.freq;
    1 => mand.noteOn;
    second => now;
}

while (true) {
    noteUp();
    noteDown();
    noteUp();
    noteDown();
}