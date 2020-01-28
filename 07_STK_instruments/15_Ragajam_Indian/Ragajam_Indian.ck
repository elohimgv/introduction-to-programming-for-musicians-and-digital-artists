// We'll play our melody on sitar
Sitar sitar => Gain master => dac;
sitar => Delay delay => Gain sitarFeedbakc => delay;
delay => master;

// Drones "singers" to accompany
VoicForm singerDrones[4];
NRev dronesRev => master;

for (0 => int i; i < singerDrones.cap(); i++) {
    singerDrones[i] => dronesRev;
    (0.5/singerDrones.cap()) => singerDrones[i].gain;
}

// Singer parameters (drone)
[26, 38, 45, 50] @=> int drones[]; // Global pitch array
0.5 => dronesRev.mix;
for (0 => int i; i < singerDrones.cap(); i++) {
    0.02 => singerDrones[i].vibratoGain;
    "lll" => singerDrones[i].phoneme;
    Std.mtof(drones[i]) => singerDrones[i].freq;
}

// Shaker percussion, and control function
Shakers shaker => master;

fun void shake() {
    // Drum control
    Math.random2(1, 2) => shaker.preset;
    Math.random2f(60.0, 128.0) => shaker.objects;
    shaker.noteOn(Math.random2f(0.0, 4.0));
}

// Global raga scale
[62, 63, 65, 67, 69, 70, 72, 74] @=> int raga[];

// Global timing/tempo parameter
0.2 => float beattime;

// Sitar echo parameters
beattime::second => delay.max;
beattime::second => delay.delay;

// Master volume parameter
0.7 => master.gain;

// MAIN PROGRAM, Ragajam_Indian.ck

// Warm up with a drone solo
5::second => now;

// Main loop, add sitar and shaker
while (true) {
    // Time variation
    Math.random2(1, 3) => float factor;
    // Loop 
    for (0 => int i; i < raga.cap(); i++) {
        // Sitar control
        Std.mtof(raga[Math.random2(0, raga.cap()-1)]) => sitar.freq;
        
        // Play a persussion sound
        shake();
        
        // Advance time by 1/2 our basic beat
        (0.5*beattime)::second*factor => now;
        
        // An occasional half-time percussion hit for flavor
        if (Math.random2(1, 3) == 1) {
            shake();
        }
        // Advance time by the other 1/2 beat
        (0.5*beattime)::second*factor => now;
    }
}