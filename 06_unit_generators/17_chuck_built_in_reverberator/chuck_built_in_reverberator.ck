// Make a new reverb and hook it up
// WARNING: Turn down the volume or wear headphones

adc => NRev rev => dac;

// Set reverb/dry mixture
0.05 => rev.mix;

// Kick back and enjoy the space
while (1) {
    1.0::second => now;
}
