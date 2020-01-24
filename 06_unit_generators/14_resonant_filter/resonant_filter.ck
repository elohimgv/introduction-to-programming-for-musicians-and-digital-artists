// Computer music! Impulse through resonant filter
Impulse imp => ResonZ filt => dac;

// Set the Q (quality factor) fairly high, to yield a pitch
100.0 => filt.Q;

while (1) {
    // Pick a random frequency
    Math.random2f(500.0, 2500.0) => filt.freq;
    
    // Fire our impulse, and hang out a bit
    100.0 => imp.next;
    0.1::second => now;
}