// Four Mando "strings", plus some smarts
// by Perry R. Cook, March 2013
public class MandoPlayer {
    // Make an array of four mandolin strings and connect them up
    Mandolin m[4];
    m[0] => JCRev rev => dac;
    m[1] => rev;
    m[2] => rev;
    m[3] => rev;
    0.25 => rev.gain;
    0.02 => rev.mix;
    
    // Set all four strings frequencies in one function
    fun void freqs(float gStr, float dStr, float aStr, float eStr) {
        m[0].freq(gStr);
        m[1].freq(aStr);
        m[2].freq(dStr);
        m[3].freq(eStr);
    }
    
    // Set all four string notes in one function
    fun void notes(int gNote, int dNote, int aNote, int eNote) {
        m[0].freq(Std.mtof(gNote));
        m[1].freq(Std.mtof(dNote));
        m[2].freq(Std.mtof(aNote));
        m[3].freq(Std.mtof(eNote));
    }
    
    // A few named chords to get you started, add your own!!
    fun void chord(string which) {
        if (which == "G") this.notes(55, 62, 71, 79);
        else if (which == "C") this.notes(55, 64, 72, 79);
        else if (which == "D") this.notes(57, 62, 69, 78); 
        else <<<"I don't know this chord: ", which>>>;
    }
    
    // Roll a chord from lowest note to highest at rate
    fun void roll(string chord, dur rate) {
        this.chord(chord);
        for (0 => int i; i < 4; i++) {
            1 => m[i].noteOn;
            rate => now;
        }
    }
    
    // Archetypical tremolo strumming
    fun void strum(int note, dur howLong) {
        int whichString;
        if (note < 62) 0 => whichString;
        else if (note < 69) 1 => whichString;
        else if (note < 76) 2 => whichString;
        else 3 => whichString;
        Std.mtof(note) => m[whichString].freq;
        now + howLOng => time stop;
        while (now < stop) {
            Std.rand2f(0.5, 1.0) => m[whichString].noteOn;
            Std.rand2f(0.06, 0.09)::second => now;
        }
    }
    
    // Damp all strings by amount
    // 0.0 = lost of damping, 1.0 = none
    fun void damp(float amount) {
        for (0 => int i; i < 4; i++) {
            amount => m[i].stringDamping;
        }
    }
    // END the MandoPlayer Class Definition
}
