// cowbell.ck
// On the fly drumming with global BPM conducting
SndBuf cow => dac;
0.3 => cow.gain;
me.dir(-1) + "/audio/cowbell_01.wav" => cow.read;

// Make a conductor for our tempo
// This is set and update elsewhere
BPM tempo;

while (1) {
    // Update our basic beat each measuere
    tempo.eighthNote => dur eighth;
    
    // Play measure of eighths
    for (0 => int beat; beat < 8; beat++) {
        // But only play on the last 8th
        if (beat == 7) {
            0 => cow.pos;
        }
        eighth => now;
    }
}