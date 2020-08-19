class TheEvent extends Event {
    int note;
    float velocity;
}

TheEvent evnt, evnt2;

// Patch
NRev globalReverb => dac;
0.1 => globalReverb.mix;

// Instrument function to spork
fun void poly(StkInstrument instr, TheEvent e, string s) {
    // Connect to output
    instr => globalReverb;
    
    // Hang out waiting to receive an event to play
    while (true) {
        // Wait
        e => now;
        // Play
        e.note => Std.mtof => instr.freq;
        e.velocity => instr.noteOn;
    }
}

// spork a few polys, listening on "evnt"
spork ~ poly(new StifKarp, evnt, "StifKarp");
spork ~ poly(new Mandolin, evnt, "Mandolin");
spork ~ poly(new Wurley, evnt, "Wurley");

// spork one poly listening on "evnt2"
spork ~ poly(new Rhodey, evnt2, "Rhodey");
[60,62,64,69,72,74,76,79] @=> int notes[];

// Play forever
while (true) {
    // Fire the next signal, on a dice roll
    Math.random2(1,6) => int dice;
    if (dice != 1) {
        // Pick a random note from our array
        notes[Math.random2(0, notes.cap()-1)] => evnt.note;
        Math.random2f(0.2, 0.9) => evnt.velocity;
        // Send the signal to only one instrument
        evnt.signal();
        // and advance time
        0.25::second => now;
    } else {
        // Play a lower notes on evnt2, and all of the evnt instruments
        notes[Math.random2(0,notes.cap()-1)] - 24 => evnt2.note;
        notes[0] - 12 => evnt.note;
        1.0 => evnt2.velocity;
        // on all instruments shreds
        evnt.broadcast();
        evnt2.signal();
        // and wait longer
        second => now;
    }
}

