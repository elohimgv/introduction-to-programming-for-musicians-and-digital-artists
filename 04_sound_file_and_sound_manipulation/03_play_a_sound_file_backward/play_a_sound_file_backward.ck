// Playing sounds in reverse
// by ChucK programmer (Elohim =)) 4102, yluj

// Sound network UGen
SndBuf mySound => dac;

me.dir()+"/audio/hihat_04.wav" => mySound.read;
// Ask the sound how long it is (in samples)
mySound.samples() => int numSamples;

// Play sound once forward
0 => mySound.pos;
numSamples::samp => now;
// and once backward
numSamples => mySound.pos;
-1.0 => mySound.rate;
numSamples::samp => now;