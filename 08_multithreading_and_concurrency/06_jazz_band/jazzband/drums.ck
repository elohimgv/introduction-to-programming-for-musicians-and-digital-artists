// drums.ck
// Sound chain
SndBuf hihat => dac;

// me.dir(), one level up to find the /audio directory
me.dir(-1) + "/audio/hihat_01.wav" => hihat.read;

// Parameter setup
0.5 => hihat.gain;

// Loop
while (true) {
    Math.random2f(0.1, 0.3) => hihat.gain;
    Math.random2f(0.9, 1.2) => hihat.rate;
    (Math.random2(1, 2) * 0.2)::second => now;
    0 => hihat.pos;
}