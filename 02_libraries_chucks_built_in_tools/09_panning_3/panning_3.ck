// Author: Elohim Guevara
// Date: October 24, 2019
// patch name: panning_3.ck
// description: Technique 3
// in audio panning.

// Audio signal chain //
// Runs the oscillator through a Pan2 object
SinOsc s => Pan2 p => dac; 

// Initialize pan position
-1.0 => float panPosition;

// loop to vary panning
while (panPosition < 1.0) {
    panPosition => p.pan;
    <<< panPosition >>>;
    panPosition + 0.01 => panPosition;
    10::ms => now;
}
