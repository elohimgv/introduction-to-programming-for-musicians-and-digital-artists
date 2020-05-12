// kick.ck, on the fly drumming with global BPM conducting
SndBuf kick => dac;
1 => kick.gain;
me.dir(-1) + "/audio/kick_04_.wav" => kick.read;

// Make a conductor for our tempo
// This is set and updated elsewhere
BPM tempo;

while (1) {
    // Update our basic beat each measure
    tempo.quarterNote => dur quarter;
    
    // Play a mesure of quarter note kicks
    for (0 => int beat; beat < 4; beat++) {
        0 => kick.pos;
        quarter => now;
    }
}