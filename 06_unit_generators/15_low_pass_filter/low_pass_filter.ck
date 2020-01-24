Noise nz => LPF lp => dac; 
//Noise nz => HPF lp => dac; 
//Noise nz => BPF lp => dac; 
//Noise nz => BRF lp => dac;

// Set frequency and Q
400.0 => lp.freq;
100.0 => lp.Q;
0.2 => lp.gain;

// Advance time
second => now;
