// FM Unit Generator Instrument Test Program
// by FM Dude, March 4, 1976

// Make an FM instrument and connect to dac
Wurley instr => dac;

// Play it forever with random frequency and duration
while (true) {
    Math.random2f(100.0, 300.) => instr.freq;
    
    // Turn note on (trigger internal ADSR)
    1 => instr.noteOn;
    Math.random2f(0.2, 0.5)::second => now;
    
    // Turn note off (ramp down internal ADSR)
    1 => instr.noteOff;
    Math.random2f(0.05, 01)::second => now;
}