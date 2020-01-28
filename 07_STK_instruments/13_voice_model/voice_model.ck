// Simple singing voice model
// by Enrico C., August 1921
SawOsc folds => ResonZ formant1 => dac;
folds => ResonZ formant2 => dac;
folds => ResonZ formant3 => dac;

// Hook up a modulation (vibrato) oscillator
SinOsc vibrato => folds;
6.0 => vibrato.freq;
1.5 => vibrato.gain;
2 => folds.sync;

// Set up filter resonance amounts
20 => formant1.Q => formant2.Q => formant3.Q;

// Sing forever, randomly
while (1) {
    Math.random2f(200, 750) => formant1.freq;
    Math.random2f(900, 2300) => formant2.freq;
    Math.random2f(2400, 3600) => formant3.freq;
    
    if (Math.random2(0, 3) == 0) {
        Math.random2f(60.0, 200.0) => folds.freq;
    }
    Math.random2f(0.2, 0.5)::second => now;
}
