// Sound chain, SinOsc to audio out
SinOsc s => dac;

// Our recursive factorial function
fun int factorial(int x) {
    sonify(x);
    if (x <= 1) return 1;
    else return (x * factorial(x-1));
}

// a function to sonify numbers
fun void sonify(int note) {
    // offset above middle c
    Std.mtof(60+(0.5*note)) => s.freq;
    1.0 => s.gain;
    300::ms => now;
    0.0 => s.gain;
    50::ms => now;
}

// Main program
sonify(factorial(2));
second => now;
sonify(factorial(3));
second => now;
sonify(factorial(4));
second => now;
sonify(factorial(5));
second => now;