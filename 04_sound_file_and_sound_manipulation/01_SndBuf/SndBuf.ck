// Using SndBuf to play a sound file
// by ChucK programmer, December 2050
SndBuf mySound => dac;

// Get file path
me.dir() => string path;
// Sound file we want to play
"/audio/kick_01.wav" => string filename;

// + sign connects strings together!
path+filename => filename;
// Tell SndBuf to read this file
filename => mySound.read;
// Set gain
0.5 => mySound.gain;
// Play sound from the beginning
0 => mySound.pos;
// Advance time so we can hear it
second => now;