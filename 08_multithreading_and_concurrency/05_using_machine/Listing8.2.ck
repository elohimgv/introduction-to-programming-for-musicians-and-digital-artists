// by Drummond Base, October 2020

// First define some global durations
1::second => dur whole;
whole/2 => dur half;
whole/4 => dur quarter;

// Kick drum function
fun void kick() {
    SndBuf kick => dac;
    me.dir() + "/audio/kick_01.wav" => kick.read;
    
    // Only play every whole note
    while(true) {
        whole => now;
        0 => kick.pos;
    }
}

// Snare drum function
fun void snare() {
    SndBuf snare => dac;
    me.dir() + "/audio/snare_01.wav" => snare.read;
    
    // Play with half note tempo
    while(true) {
        half => now;
        0 => snare.pos;
    }
}

// Hi hat drum function
fun void hihat() {
    SndBuf hihat => dac;
    me.dir() + "/audio/hihat_01.wav" => hihat.read;
    0.2 => hihat.gain;
    
    // Play every quarter note
    while (true) {
        quarter => now;
        0 => hihat.pos;
    }
}

// Main program to spork our individual drum functions
// start off with kick drum for two measures
spork ~ kick();
2*whole => now;

// Then add in hi hat after two measures
spork ~ hihat();
2*whole => now;

// Add snare, but on off beats (quarter delayed start)
quarter => now;
spork ~ snare();

// Let ir run for four more measures
4*whole => now;