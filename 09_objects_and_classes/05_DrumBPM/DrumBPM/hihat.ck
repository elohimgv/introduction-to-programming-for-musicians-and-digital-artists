// hihat.ck
// on the fly drumming with global BPM conducting
SndBuf hat => dac;
0.3 => hat.gain;
me.dir(-1)+"/audio/hihat_02.wav" => hat.read;

// make a conductor for our tempo
// this is set and updated elsewhere
BPM tempo;

while (1) {
    // update our basic beat each measure
    tempo.eighthNote => dur eighth;
    // play a measure of eighth notes
    for (0 => int beat; beat < 8; beat++) {
        // play mostly, but leave out last eighth
        if (beat != 7) {
            0 => hat.pos;
        }
        eighth => now;
    }
}