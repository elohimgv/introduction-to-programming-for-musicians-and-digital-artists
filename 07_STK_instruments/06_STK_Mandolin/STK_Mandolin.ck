// Sound chain (Mandolin physical instrument model)
Mandolin mand => dac;

// Notes to play
[79, 78, 74, 78, 76, 72] @=> int solomio[];

for (0 => int i; i < solomio.cap(); i++) {
    Std.mtof(solomio[i]) => mand.freq;
    // Random plucking position
    Math.random2f(0.2, 0.8) => mand.pluckPos;
    // Random detune between strings in pair
    Math.random2f(0.05, 0.11) => mand.stringDetune;
    
    // Tremolo strumming gesture
    for (0 => int trem; trem < 12; trem++) {
        1 => mand.noteOn;
        Math.random2f(0.06, 0.09)::second => now;
    }
}

