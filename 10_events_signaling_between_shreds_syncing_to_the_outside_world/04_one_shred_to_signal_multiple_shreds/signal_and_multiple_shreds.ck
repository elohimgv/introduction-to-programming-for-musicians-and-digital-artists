// Declare an event we will use for signaling
Event evnt;

// Function that waits on an event
fun void bar(Event anEvent, string msg, float freq) {
    Impulse imp => ResonZ rez => dac;
    50 => rez.Q;
    
    while (true) {
        // Wait
        anEvent => now;
        // Action
        <<<msg, freq, now /second>>>;
        freq => rez.freq;
        50 => imp.next;
    }
}

spork ~ bar(evnt, "Hi ", 500.0);
spork ~ bar(evnt, "There ", 700.0);
spork ~ bar(evnt, "Sport! ", 900.0);

// Then signal the event forever in a loop
while (true) {
    // Fire the next signal
    evnt.signal();
    // Uncomment the two event signal() message is
    // sent a total of three times... hearing all
    // three sounds at once 
    //evnt.signal();
    //evnt.signal();
    
    
    // To notify and wake up multiple shreds with a
    // singel message instead of three signals...   
    // like above
    //evnt.broadcast();
    
    // Advance time
    1::second => now;
}
