// Sound chain: two drums
SndBuf kick => dac;
SndBuf snare => dac;

// Load the sound files for our drums
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_03.wav" => snare.read;

// Set their pointers to end, to make no sound
kick.samples() => kick.pos;
snare.samples() => snare.pos;

// Drum patterns as logical variables
[1, 0, 0, 0, 1, 0, 0, 0] @=> int kickPattern1[];
[0, 0, 1, 0, 0, 0, 1, 0] @=> int kickPattern2[];
[1, 0, 1, 0, 1, 0, 1, 0] @=> int snarePattern1[];
[1, 1, 1, 1, 0, 1, 1, 1] @=> int snarePattern2[];

// Function to play pattern arrays
fun void playSection(int kickA[], int snareA[], float beatTime) {
    for (0 => int i; i < kickA.cap(); i++) {
        if (kickA[i]) {
            0 => kick.pos;
        }
        
        if (snareA[i]) {
            0 => snare.pos;
        }
        
        beatTime::second => now;
    }
}

// Main program, infinite loop
while (true) {
    playSection(kickPattern1, snarePattern2, 0.2);
    playSection(kickPattern2, snarePattern2, 0.2);
    playSection(kickPattern1, snarePattern2, 0.2);
    playSection(kickPattern2, snarePattern1, 0.2);
}