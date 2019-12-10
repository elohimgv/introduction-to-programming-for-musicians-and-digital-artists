// Suck samples through Gain UGen into blackhole
adc => Gain g => blackhole;

while (true) {
    // if it's loud enough
    if (g.last() > 0.9) {
        // print it out
        <<<"LOUD!!!", g.last()>>>;
    }
    // do this for every sample
    samp => now;
}