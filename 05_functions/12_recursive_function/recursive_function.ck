// Sound chain, mandolin to audio out
Mandolin mand => dac;

// Recursive scale player
fun int recurScale(int note, dur rate) {
    Std.mtof(note) => mand.freq;
    
    1 => mand.noteOn;
    rate => now;
    
    // Only do it until some limit is reached
    if (note > 40) {
        // Here's the recursion, it calls itself!
        recurScale(note-1, rate);
    }
}

recurScale(60, 0.5::second);
recurScale(67, 1.0::second);