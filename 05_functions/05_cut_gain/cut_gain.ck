SinOsc s => dac;

// Our function
fun float halfGain(float originalGain) {
    return (originalGain*0.5);
}

// Remember that .gain is a function built into SinOsc
<<<"Full Gain: ", s.gain() >>>;
second => now;

// Call halfGain()
halfGain(s.gain()) => s.gain;
<<< "Gain is now half: ", s.gain() >>>;
second => now;