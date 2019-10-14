// Author: Elohim Guevara
// Date: October 14, 2019
// patch name: square_wave_music.ck
// description: playing with logic and
// structure and random functions.

SqrOsc t => dac;

// Infinite loop runs forever
while (true) {
    // Randomly choose frequency from 30 to 1000
    Math.random2(300, 1000) => t.freq;
    
    // Random choose duration from 30 to 1000 ms
    Math.random2f(30, 1000)::ms => now;
}