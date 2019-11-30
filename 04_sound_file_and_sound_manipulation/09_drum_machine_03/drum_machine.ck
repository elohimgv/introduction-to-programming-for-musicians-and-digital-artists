// Drum Machine, version 3.0
// by block-rockin programmer, Dec 31, 1999

// SndBufs for kick (bass) and snare drums
SndBuf kick => Gain master => dac;
SndBuf snare => master;
SndBuf hihat => master;

// Load up some samples of those
me.dir()+"/audio/kick_01.wav" => kick.read;
me.dir()+"/audio/snare_01.wav" => snare.read;
me.dir()+"/audio/hihat_01.wav" => hihat.read;
0.3 => hihat.gain;

0.15::second => dur tempo;

// Scores (arrays) to tell drums when to play
[1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0] @=> int kickHits[];
[0,0,1,0,0,0,1,0,0,0,0,0,1,1,1,1] @=> int snareHits[];

while (true) {
    0 => int beat;
    while (beat < kickHits.cap()) {
        // Play kick drum based on array value
        if (kickHits[beat]) {
            0 => kick.pos;
        }
        if (snareHits[beat]) {
            0 => snare.pos;
        }
        // Always play hithat
        1 => hihat.pos;
        tempo => now;
        beat++;
    }
}

