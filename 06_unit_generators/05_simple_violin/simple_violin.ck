// Simple SawOsc-based violin with ADSR envelope and vibrato
SinOsc vibrato => SawOsc viol => ADSR env => dac;

// Tell the oscillator to interpret input as frequency modulation
2 => viol.sync;
// Set vibrato frequency to 6 Hz
6.0 => vibrato.freq;
// Set all ADSR parameters at once
env.set(0.1::second, 0.1::second, 0.5, 0.1::second);
// Define a D Major scale (in MIDI note numbers)
[62, 64, 66, 67, 69, 71, 73, 74] @=> int scale[];
// Run through our scale one note at a time
for (0 => int i; i < scale.cap(); i++) {
    // Set frequency according to note number
    //Std.mtof(scale[i]) => viol.freq;
    
    /*Othe forms to play with this example*/
    // Set both frequencies according to note number
    //Std.mtof(scale[i]) => viol.freq => vibrato.freq;
    
    // Set carrier and modulator freq randomly
    Math.random2f(300.0,1000.0) => viol.freq;
    Math.random2f(300.0,1000.0) => vibrato.freq;
    
    100 => vibrato.gain;
    // Trigger note and wait a bit
    1 => env.keyOn;
    0.3::second => now;
    // Turn off note and wait a bit
    1 => env.keyOff;
    0.1::second => now;
}

// Repeat last note with lots of vibrato
1 => env.keyOn;
10.0 => vibrato.gain;
1.0::second => now;
0 => env.keyOff;
0.2::second => now;