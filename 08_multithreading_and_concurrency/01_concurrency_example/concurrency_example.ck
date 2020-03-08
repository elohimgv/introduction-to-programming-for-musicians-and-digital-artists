// Function foo
fun void foo() {
    // Sound for foo process
    Impulse foo => ResonZ rez => dac.left; 
    800.0 => rez.freq;
    50 => rez.Q;
    
    // Infinite time loop
    while(true) {
        // Print and make sound
        <<<"foo!", "">>>;
        100 => foo.next;
        // Advance time
        250::ms => now;
    }
}

// Function bar
fun void bar() {
    // Sound for bar process
    Impulse bar => ResonZ rez => dac.right;
    700.0 => rez.freq;
    50 => rez.Q;
    
    // Infinite time loop
    while(true) {
        // Print and make sound
        <<<"BAAAAAAR!!!", "">>>;
        100 => bar.next;
        // Advance time
        1::second => now;
    }
}

// Spork foo() and bar() each on a child shred
spork ~ foo();
spork ~ bar();

// Infinite time loop to serve as a parente shred
while(true) 1::second => now;