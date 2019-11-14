// Play a sound file repeatedly in a loop
// by ChucK programmer, January 12, 2017

// Soun chain UGen's
SndBuf mySound => Pan2 pan => dac;
// Get file path and load file all in one line!
me.dir()+"/audio/kick_01.wav" => mySound.read;

// Play our sound over and again in an infinite loop
while (true) {
    // Random gain, rate (pitch), and pan each time
    Math.random2f(0.1, 1.0) => mySound.gain;
    Math.random2f(-1.0, 1.0) => pan.pan;
    Math.random2f(0.2, 1.8) => mySound.rate;
    
    // (Re)start the sound by setting position to 0
    0 => mySound.pos;
    // Advance time so we can hear it
    500.0::ms => now;
}
