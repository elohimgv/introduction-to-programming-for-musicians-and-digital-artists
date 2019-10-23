// Sound chain
SqrOsc t => dac;
0.4 => t.gain;

// while loop
0 => int i;
while (i < 127) {
    // MIDI to Hertz frequency
    Std.mtof(i) => float Hz; 
    // Print out result
    <<< i, Hz >>>; 
    // Update frequency
    Hz => t.freq;
    // Advance time
    100::ms => now;
    // Counter
    i++;
}