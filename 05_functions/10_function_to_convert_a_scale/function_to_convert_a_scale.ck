// Make a mandolin and hook it to audio out
Mandolin mand => dac;

// Global scale array
[60, 62, 63, 65, 67, 69, 70, 72] @=> int scale[];

// Function to modify an element of an array
fun void arrayAdder(int temp[], int index) {
    1 +=> temp[index];
}

// Play scale on mandolin
fun void playScale(int temp[]) {
    for (0 => int i; i < temp.cap(); i++) {
        Std.mtof(temp[i]) => mand.freq;
        <<<i, temp[i]>>>;
        1 => mand.noteOn;
        0.4::second => now;
    }
    second => now;
}

// Play our scale on our mandolin
<<<"Original Scale">>>;
playScale(scale);

// Modify our scale
arrayAdder(scale, 2);
arrayAdder(scale, 6);

// Play scale again, sounds different, huh?
<<<"Modified Scale:">>>;
playScale(scale);