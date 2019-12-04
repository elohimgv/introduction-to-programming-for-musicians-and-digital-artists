SndBuf2 click => dac;

// Read sound file
me.dir() + "/audio/stereo_fx_01.wav" => click.read;

// Function to hack up any sound file
fun void granularize(SndBuf myWav, int steps) {
    myWav.samples()/steps => int grain;
    Math.random2(0, myWav.samples() - grain) + grain => myWav.pos;
    grain::samp => now;
}

// Main program
while (true) {
   // call function, time passes there
    granularize(click, 70);
} 