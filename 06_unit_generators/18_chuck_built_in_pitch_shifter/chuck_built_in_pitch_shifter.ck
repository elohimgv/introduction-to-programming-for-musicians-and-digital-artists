// Run microphone input through pitch shifter
adc => PitShift p => dac;
// Set mix to all pitch shift (no dry signal)
1.0 => p.mix;

// Forever shinfting pitch
while (1) {
    // Pick a random shift across +/- 1 octave
    Math.random2f(0.5, 2.0) => p.shift;
    0.2::second => now;
}
