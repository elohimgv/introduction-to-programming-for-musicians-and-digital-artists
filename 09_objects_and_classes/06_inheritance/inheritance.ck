// A clarinet that understands MIDI note numbers in noteOn!
public class MyClarinet extends Clarinet {
    // Here we define one new function
    fun float noteOn(int noteNum, float volume) {
        // We set frequency using MIDI note nomber
        Std.mtof(noteNum) => this.freq; // Use Clarinet's built in .freq method
        // Then call the built-in inherited noteOn
        volume => this.noteOn; // and uses Clarinet's noteOn set volume
    }
}

// Make a new instance of our special clarinet
MyClarinet myclar => dac;

// Test our new note On function
myclar.noteOn(60, 1.0);
second => now;
1 => myclar.noteOff;
second => now;
// Test our old noteOn function
myclar.noteOn(1.0);
second => now;