// by Elohim Guevara, March 2020

/* Global variables */
// Triangle oscillator
TriOsc triOscOne => dac; 
// Set triOscOne volume
0.0 => triOscOne.gain; 
// Mster to control the volume
Gain master => dac;
// Set master volume
0.0 => master.gain;
// Triangle oscillators
TriOsc triOscTwo => master; 
TriOsc triOscThree => master;
TriOsc triOscFour => master;
// Notes ('C' major sacle)
[36, 40, 43, 45, 47, 50] @=> int pitches[];  
// Note and chords durations 
380::ms => dur durPitch; 
1::second => dur durChord;
durPitch => dur durSample;
// Sound files
SndBuf clap => master;
SndBuf click => master;
SndBuf hihat => master;
SndBuf kick => master;
SndBuf snare => master;
me.dir() + "/audio/clap_01.wav" => clap.read;
me.dir() + "/auido/click_03.wav" => click.read;
me.dir() + "/audio/hihat_05.wav" => hihat.read;
me.dir() + "/audio/kick_05.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;

function void patternToPlayNotes(int noteOne, int noteTwo, int noteThree) {    
    Std.mtof(noteOne) => triOscOne.freq;
    durPitch => now;
    Std.mtof(noteTwo) => triOscOne.freq;
    durPitch => now;
    Std.mtof(noteThree) => triOscOne.freq;
    durPitch => now;
}

function void notes() {
    0 => int rep;
    while (rep < 1) {
        0 => int counter;
        do {
            0.4 => triOscOne.gain;
            Std.mtof(pitches[counter]) => triOscOne.freq;
            <<<"Note: ", pitches[counter]>>>;
            durPitch => now;
           
            if (pitches[counter] == 36) { 
                patternToPlayNotes(pitches[1], pitches[2], pitches[3]);
            }
            
            if (pitches[counter] == 40) { 
                patternToPlayNotes(pitches[2], pitches[3], pitches[0]);
            }
            
            if (pitches[counter] == 43) { 
                patternToPlayNotes(pitches[3], pitches[0], pitches[1]);
            }
            
            if (pitches[counter] == 45) { 
                patternToPlayNotes(pitches[0], pitches[1], pitches[2]);
            }
            
            patternToPlayNotes(pitches[0], pitches[3], pitches[0]);
            
            counter++;
        } while(counter < pitches.cap() - 2);
    rep++;   
    }  
}

function void samples() {
    0.1 => master.gain;
    0 => int rep;
    while (rep < 8) {
        0 => int counter;
        while (counter < pitches.cap() - 2) {
            if (pitches[counter] == 36) { 
                0 => clap.pos;
                0 => hihat.pos;
                durSample => now;
            }
                
            if (pitches[counter] == 40) {
                0 => click.pos;
                0 => kick.pos;
                0 => snare.pos;
                durSample => now;
            }
                
            if (pitches[counter] == 43) { 
                0 => clap.pos;
                0 => hihat.pos;
                durSample => now;
            }
                
            if (pitches[counter] == 45) { 
                0 => click.pos;
                0 => kick.pos;
                0 => snare.pos;
                durSample => now;
            }
         counter++;
        }
        rep++;
    }  
}

function void chords(int noteOne, int noteTwo, int noteThree) {
    0.25 => master.gain;
    Std.mtof(noteOne) => triOscTwo.freq;
    Std.mtof(noteTwo) => triOscThree.freq;
    Std.mtof(noteThree) => triOscFour.freq;
    durChord => now;
}

// MAIN PROGRAM
spork ~ notes();

spork ~ samples();

for (0 => int i; i < 4; i++) {
    spork ~ chords(pitches[0], pitches[1], pitches[2]);
    second => now;
    spork ~ chords(pitches[2], pitches[4], pitches[5]);
    second => now;
    spork ~ chords(pitches[1], pitches[2], pitches[4]);
    second => now;
}




