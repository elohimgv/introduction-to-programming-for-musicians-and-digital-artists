// Simple Clarinet Synthesis
// Envelope applied to SqrOsc
SqrOsc clar => Envelope env => dac;

// Initial note frequency (musical A)
55.0 => clar.freq;
// Play up the overtone series
while (clar.freq() < 441.0) {
    // Trigger envelope
    1 => env.keyOn;
    // hang out a bit
    0.2::second => now;
    // tell envelope to ramp down
    1 => env.keyOff;
    // hang out some more
    0.2::second => now;
    clar.freq() + 55.0 => clar.freq;
}