// Drum Machine, version 1.0
// by block-rockin programmer, Dec 31, 1999}

// SndBufs for kick (bass) and snare drums
SndBuf kick => Gain master => dac;
SndBuf snare => master;

// Load up some samples of those
me.dir()+"/audio/kick_01.wav" => kick.read;
me.dir()+"/audio/snare_01.wav" => snare.read;

while (true) {
    // Beat 1, play kick drum alone
    0 => kick.pos;
    0.6::second => now;
    
    // Play both drums on Beat 2
    0 => kick.pos;
    0 => snare.pos;
    0.6::second => now;
}

