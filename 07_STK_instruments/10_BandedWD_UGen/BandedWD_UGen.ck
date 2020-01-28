// Test some Banded WaveGuide parameters
BandedWG bwg => dac;
// Set to model Tibetan prayer bowl
3 => bwg.preset;
// Whack the "bowl" to get it started
1 => bwg.noteOn;
// Bring the bowl to the surface
1 => bwg.startBowing;

// Then bow it with increasing pressure
for (0 => int i; i <= 7; i++) {
    <<<"bowPressure=", i*0.1 => bwg.bowPressure>>>;
    second => now;
}
// Then bow it with decreasing pressure
for (6 => int i; i > 0; i--) {
    <<<"bowPressure=", i*0.1 => bwg.bowPressure>>>;
    second => now;
}
