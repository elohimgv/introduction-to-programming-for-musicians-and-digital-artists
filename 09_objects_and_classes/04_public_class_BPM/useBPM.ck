// This lives in file useBPM.ck
SinOsc s => dac;
BPM t; // Define t object of class BPM
t.tempo(300);  // Set tempo in BPM
0.3 => s.gain;

400 => int freq;
while (freq < 800) {
    freq => s.freq;
    t.quarterNote => now;
    50 +=> freq;
}