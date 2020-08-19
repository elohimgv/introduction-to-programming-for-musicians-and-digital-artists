// Declare an event we will use for signaling
Event evnt;

// Function that waits on an event
fun void foo(Event anEvent) {
    Impulse imp => dac;
    
    while (true) {
        // Wait
        anEvent => now;
        // Action
        <<<"Hey!!!", now / second>>>;
        5 => imp.next;
    }
}

// spork a foo
spork ~ foo(evnt);
// Then signal the event forever in a loop
while (true) {
    // Fire the next signal
    evnt.signal();
    // Advance time
    1::second => now;
}
