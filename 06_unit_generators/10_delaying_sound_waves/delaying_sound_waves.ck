// Delaying sound waves 

//SinOsc wave => Delay d => dac;
//SawOsc wave => Delay d => dac;
//TriOsc wave => Delay d => dac;
SqrOsc wave => Delay d => dac;

230::ms => d.delay;
d => d;
Math.random2f(245.7,323.4) => wave.freq;
<<<wave.freq()>>>;
0.8 => wave.gain;
second*3 => now;







