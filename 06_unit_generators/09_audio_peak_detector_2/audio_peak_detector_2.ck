// New version of audio peak detector

// Sound chain
adc => Gain master => blackhole; 
SinOsc wave =>  dac;

// Infinite loop
while (true) {
    // If master (the last sample catch through adc UGen) 
    // is greater than 0.01
    if (master.last() > 0.01) {
        // Print this out
        <<<"It's to loud!!!", master.last()>>>; 
        // Set wave volume on
        master.last() => wave.gain;
        // Set frequency
        Math.random2(147,347) => wave.freq;
        // Print this out
        <<<"Frequency: ", wave.freq()>>>;
    }
    else {
      // Set wave volume off 
      0.0 => wave.gain; // Comment this line, and hear what happend
    }
    // Advance time to hear and execute the loop
    samp => now;
}



