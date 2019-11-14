// Playing multiple sounds
// by ChucK programmer (Pizzuto) July, 2019
// Playing different sound files (method 1) 
// with a single SndBuf. Files are loaded 
// inside the loop.

// Sound chain
SndBuf snare => dac;

// Make and fill an array of sound file paths+names
string snare_samples[3];
me.dir()+"/audio/snare_01.wav" => snare_samples[0];
me.dir()+"/audio/snare_02.wav" => snare_samples[1];
me.dir()+"/audio/snare_03.wav" => snare_samples[2];

// Infinite loop
while(true) {
    // Pick a random number between 0 and #files
    Math.random2(0, snare_samples.cap()-1) => int which;
    // Load up that file
    snare_samples[which] => snare.read;
    // Let ti play
    0.5::second => now;
}