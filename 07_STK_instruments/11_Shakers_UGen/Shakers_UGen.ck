// Fun with particles, the Shakers instrument
Shakers shak => dac;
// Run through all the presets in order
/*for (0 => int i; i < 23; i++) {
    i => shak.preset;
    1 => shak.noteOn;
    1.0::second => now;
}*/

17 => shak.preset;
// Then fiddle around with #objects and damping
while (1) {
    // Random numbers of quarters
    Math.random2f(0.0, 128.0) => shak.objects;
    // Random amount of damping (decay time)
    Math.random2f(0.0, 1.0) => shak.decay;
    <<<"#Objects=", shak.objects(), "damp=", shak.decay()>>>;
    1.0 => shak.energy;
    1.0::second => now;
}


