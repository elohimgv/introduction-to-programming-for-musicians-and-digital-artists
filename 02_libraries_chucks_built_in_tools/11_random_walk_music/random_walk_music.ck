// 2-part Random Music with panning
// by ChucK Team, September 25, 2020

// Two oscillators, melody and harmony
SinOsc sin => Pan2 mpan => dac;
TriOsc tri => dac; 

// We will use these to separate notes later
0.5 => tri.gain;
0.5 => float onGain;
0.0 => float offGain;

72 => int melodyNote;

while (true) {
    // Set melody pitch somewhat randomly, with limits
    Math.random2(-3, 3) +=> melodyNote;
    if (melodyNote < 60) {
        // Lower limit on melody
        60 => melodyNote;
    }
    if (melodyNote > 84) {
        // Upper limit on melody
        84 => melodyNote;
    }
    
    Std.mtof(melodyNote) => sin.freq;
    // Melody has a random pan for each note
    Math.random2f(-1.0, 1.0) => mpan.pan;
    // On a "dice roll", change harmony note
    if (Math.random2(1, 6) == 1) {
        Std.mtof(melodyNote-12) => tri.freq;
    }
    // Pick one of three random durations
    Math.random2(1, 3) * 0.2 => float myDur;
    // Note on time is 80% of duration
    onGain => sin.gain;
    (myDur * 0.8)::second => now;
    // Space between notes is 20% of array duration
    offGain => sin.gain;
    (myDur * 0.2)::second => now;
}