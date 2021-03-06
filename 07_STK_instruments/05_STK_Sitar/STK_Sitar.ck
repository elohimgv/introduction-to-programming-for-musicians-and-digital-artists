// Sound chain (sitar instrument model)
Sitar sit => dac; 

// Indian scale is called a rag (rhymes with frog)
[50, 51, 54, 55, 57, 58, 61, 62] @=> int rag[];

for (0 => int i; i < rag.cap(); i++) {
    Std.mtof(rag[i]) => sit.freq;
    1 => sit.noteOn;
    0.5::second => now;
}
