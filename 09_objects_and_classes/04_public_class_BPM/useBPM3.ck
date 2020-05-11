// This lives in another file, useBPM3.ck
SinOsc s => dac;
BPM t2;
0.3 => s.gain;

// And set tempo to a random number
Math.random2f(200.0, 1000.0) => t2.tempo;

1000 => int freq;
while (freq > 400) {
    freq => s.freq;
    t2.quarterNote => now;
    50 -=> freq;
}