// Lives in another file, useBPM.ck
SinOsc s => dac.right;
BPM t2; // Define another BPM named t2
0.3 => s.gain;

800 => int freq;
while (freq > 400) {
    freq => s.freq;
    t2.quarterNote => now;
    50 -=> freq;
}