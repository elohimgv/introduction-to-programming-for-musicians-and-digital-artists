// PulseOsc for techno-bass, by Chuck Programmer, 2014

// Connect a new PulseOsc to dac
PulseOsc p => dac;

// Infinite loop of sci-fi techno!
while (true) {
    // Set random pulse width
    Math.random2f(0.01, 0.5) => p.width;
    // pick a pitch randomly
    if (Math.random2(0, 1)) {
        // from one of
        84.0 => p.freq;
    } else {
        // two different pitches
        100.0 => p.freq;
    }
    
    // turn on oscillator
    1 => p.gain;
    // hang out a bit
    0.06::second => now;
    
    // turn off oscillator
    0.0 => p.gain;
    // hang out a bit
    0.04::second => now;
}