// Simple example of a resonant pop sound-making class
public class Simple {
    // Our Simple instrument patch
    Impulse imp => ResonZ filt => dac;
    
    // Some default settings
    100.0 => filt.Q => filt.gain;
    1000.0 => filt.freq;
    
    // Set freq as we would any instrument
    fun void freq(float freq) {
        freq => filt.freq;
    }
    
    // Method to allow setting Q
    fun void setQ(float Q) {
        Q => filt.Q;
    }
    
    // Method to allow setting gain
    fun void setGain(float gain) {
        filt.Q() * gain => imp.gain;
    }
    
    // Play a note by firing impulse
    fun void noteOn(float volume) {
        volume => imp.next;
    }
}

// Make an instance of a (declare) one of our Simples
Simple s;

while (1) {
    // Random frequency
    //Std.rand2f(1100.0, 1200.0) => s.freq;
    s.freq(1200.0);
    s.setGain(0.05);
    // Play a note an wait a bit
    1 => s.noteOn;
    0.1::second => now;
}