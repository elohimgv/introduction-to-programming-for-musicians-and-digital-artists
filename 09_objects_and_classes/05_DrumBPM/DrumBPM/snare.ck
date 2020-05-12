// snare.ck
// On the fly drumming with global BPM conducting
SndBuf snare => dac;
me.dir(-1) + "/audio/snare_01.wav" => snare.read;
0.5 => snare.gain;
snare.samples() => snare.pos;

// Make a conductor for our tempo
// This is set and updated elsewhere
BPM tempo;

while (1) {
    // Update our basic beat each measure
    tempo.quarterNote => dur quarter;
    
    // Play measure of: rest, snare, rest, sna-snare
    quarter => now;
    0 => snare.pos;
    2.0*quarter => now;
    0 => snare.pos;
    quarter/4.0 => now;
    0 => snare.pos;
    3.0*quarter/4.0 => now;
}