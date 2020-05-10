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
    
    // Three ways of setting pitch
    // one by float frequency
    fun float pitch(float freq) {
        return freq => filt.freq;
    }
    
    // Another to set pitch by MIDI note number
    fun float pitch(int noteNum) {
        return Std.mtof(noteNum) => filt.freq;
    }
    
    // Another way to set pitch by noteName, capital A-G required
    // Needs specific format: CA, D#5, Eb3, Bf6
    fun float pitch(string noteName) {
        [21, 23, 12, 14, 16, 17, 19] @=> int notes[];
        noteName.charAt(0) - 65 => int base;
        notes[base] => int note;
        0.0 => float freq;
        if (base > -1 && base < 7) {
            if (noteName.charAt(1) == '#') // either '#' symbol
                notes[base] + 1 => note;
            if (noteName.charAt(1) == 's') // or 's' counts for sharp
                notes[base] + 1 => note;
            if (noteName.charAt(1) == 'b') // either 'b' or
                notes[base] - 1 => note;
            if (noteName.charAt(1) == 'f') // 'f' counts for flat
                notes[base] - 1 => note;
        } else {
            <<<"Illegal Note Name!!">>>;
            return 0.0;
        }
        noteName.charAt(noteName.length() - 1) - 48 => int oct;
        if (oct > - 1 && oct < 10) {
            note + 12*oct => note;
            return this.pitch(note);
        } else {
            <<<"Illegal Octave!!">>>;
            return 0.0;
        }
    }
}

// Make a Simple, and test new pitch functions
Simple s;

// MIDI note number pitch
s.pitch(60);
1 => s.noteOn;
second => now;

// Pitch as float frequency
s.pitch(440.0);
1 => s.noteOn;
second => now;

// Pitch as note name string
s.pitch("G#5");
1 => s.noteOn;
second => now;

