// Loading and panning stereo sound files
// by ChucK programmer (Elogim), October 2023
// Stereo panning with stereo sound files using SndBuf2

// Declare and load up a stereo file
SndBuf2 myStereoSound;
me.dir()+"/audio/stereo_fx_03.wav" => myStereoSound.read;

// We'll use these for stereo panning
Gain bal[2];

// Connect everything up in stereo
myStereoSound.chan(0) => bal[0] => dac.left;
myStereoSound.chan(1) => bal[1] => dac.right;
// Set our soundfile to repeat forever
1 => myStereoSound.loop;

while(true) {
    // Pick a random playback rate and a random panning
    Math.random2f(0.2, 1.8) => myStereoSound.rate;
    Math.random2f(-1.0, 1.0) => float balance;
    
    // Turn balance into left/right gain between 0 and 1.0
    (balance+1) / 2.0 => float rightGain;
    1.0 - rightGain => float leftGain;
    leftGain => bal[0].gain;
    rightGain => bal[1].gain;
    
    0.3::second => now;
}