// Sound chain
ModalBar modal => NRev reverb => dac;
// Set reverb mix
0.1 => reverb.mix;
// Modal bar parameters 
7 => modal.preset;
0.9 => modal.strikePosition;

// spork() detune() as a child shred
// Note: must do this before entering into infinite loop below!
spork ~ detune();

// Infinite time loop
while (true) {
   // First note! then wait
    1 => modal.strike;
    250::ms => now;
    0.7 => modal.strike; // Another note! then wait
    250::ms => now;
    0.9 => modal.strike; // One more note! then wait
    250::ms => now;
    
    // Now play four quick notes
    repeat(4) { 
        // Note! and wait
        0.5 => modal.strike;
        62.5::ms => now;
    }
} 

// Function to vary tuning over time
function void detune() {
    while (true) {
        // Update frequency sinusoidally
        84 + Math.sin(now/second*0.25*Math.PI) * 2 => Std.mtof => modal.freq;
        // Advance time (controls update rate)
        5::ms => now;
    }
}