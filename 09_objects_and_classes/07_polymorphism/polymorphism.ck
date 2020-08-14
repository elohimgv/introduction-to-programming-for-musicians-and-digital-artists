// swell function, operates on any type of UGen
fun void swell(UGen osc, float begin, float end, float grain) {
    float val;
    // Swell up volume
    for (begin => val; val < end; grain +=> val) {
        val => osc.gain;
        0.01::second => now;
    }
    // swell down volume
    while (val > begin) {
        val => osc.gain;
        grain -=> val;
        0.01::second => now;
    }
}

// MAIN PROGRAM
SinOsc s => dac;
swell(s, 0.01, 0.9, 0.01);