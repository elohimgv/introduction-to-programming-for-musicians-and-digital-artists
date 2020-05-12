public class BPM {
    // Global variables
    static dur quarterNote, eighthNote, sixteenthNote, thirtysecondNote;
    
    fun void tempo(float beat) {
        // Beat argument is BPM, example 120 beats per minute
        60.0/(beat) => float SPB; // Seconds per beat
        SPB::second => quarterNote;
        quarterNote*0.5 => eighthNote;
        eighthNote*0.5 => sixteenthNote;
        sixteenthNote*0.5 => thirtysecondNote;
    }
}

SinOsc s => dac;
BPM t; // Define t object of class BPM
t.tempo(300); // Set tempo in BPM

400 => int freq;
while (freq < 800) {
    freq => s.freq;
    t.quarterNote => now; // quarterNote "memeber variable"
    50 +=> freq;
}