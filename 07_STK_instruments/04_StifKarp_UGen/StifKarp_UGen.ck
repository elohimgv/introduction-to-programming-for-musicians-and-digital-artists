// Sound chain 
StifKarp skarp => dac; // Stiff string model

while (1) {
    // .stretch method controls stiffness
    Math.random2f(0.3, 1.0) => skarp.stretch;
    1 => skarp.noteOn;
    0.3::second => now;
}
