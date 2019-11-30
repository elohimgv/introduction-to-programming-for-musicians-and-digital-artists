// Drum Machine, version 4.0
// by block-rockin programmer, Jan 1, 2099
// Here we'll use Modulo % and random to play drums

// Define Gains left, center, right
Gain master[3];
master[0] => dac.left;
master[1] => dac;
master[2] => dac.right;

// Declare SndBufs for lots of drums
// hook them up to pan positions
SndBuf kick => master[1];
SndBuf snare => master[1];
SndBuf hihat => master[2];
SndBuf cowbell => master[0];

// Use a Pan2 for the hand claps,
// we'll use random panning later
SndBuf claps => Pan2 claPan;
claPan.chan(0) => master[0];
claPan.chan(1) => master[2];

me.dir()+"/audio/kick_01.wav" => kick.read;
me.dir()+"/audio/snare_01.wav" => snare.read;
me.dir()+"/audio/hihat_01.wav" => hihat.read;
me.dir()+"/audio/cowbell_01.wav" => cowbell.read;
me.dir()+"/audio/clap_01.wav" => claps.read;

// Array for controlling our cowbell strikes
[1,0,1,0, 1,0,0,1, 0,1,0,1, 0,1,1,1] @=> int cowHits[];

// Controls the overall length of our "measures"
cowHits.cap() => int MAX_BEAT; // all caps, remember?

// Modulo number for controlling kick and snare
4 => int MOD;

// overall speed control
0.15::second => dur tempo;

// Counters: beat within measures, and measure
0 => int beat;
0 => int measure;

// Main infinite drum loop
while (true) {
    // play kick drum on all main beats (0, 4, ...) 
    if (beat % MOD == 0) {
        0 => kick.pos;
    }
    // after a time, randomly play hihat or cowbell
    if (measure > 1) {
        if (cowHits[beat]) {
            0 => cowbell.pos;
        }
        else {
            Math.random2f(0.0, 1.0) => hihat.gain;
            0 => hihat.pos;
        }
    }
    // After a time, play randomly spaced claps at end of mesure
    if (beat > 11 && measure > 3) {
        Math.random2f(-1.0, 1.0) => claPan.pan;
        0 => claps.pos;
    }
    tempo => now;
    (beat + 1) % MAX_BEAT => beat;
    if (beat == 0) {
       measure++;
    } 
}