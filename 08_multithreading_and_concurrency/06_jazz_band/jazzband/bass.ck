// bass.ck
// Sound chain (mandolin for bass)
Mandolin bass => NRev r => dac;

// Parameters setup
0.1 => r.mix;
0.0 => bass.stringDamping;
0.02 => bass.stringDetune;
0.05 => bass.bodySize;
0.5 => bass.gain;

// Jazz scala data
[41,43,45,50,51,53,60,63] @=> int scale[];
// Pointer for position within scale
4 => int walkPos;

// Loop 
while (true) {
    <<<walkPos>>>;
    Math.random2(-1,1) +=> walkPos;
    if (walkPos < 0) 1 => walkPos;
    if (walkPos >= scale.cap()) scale.cap()-2 => walkPos;  
    Std.mtof(scale[walkPos]-12) => bass.freq;
    Math.random2f(0.05,0.5) => bass.pluckPos;
    1 => bass.noteOn;
    0.55::second => now;
    1 => bass.noteOff;
    0.05::second => now;
}