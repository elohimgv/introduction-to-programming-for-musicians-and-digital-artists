// score.ck, on the fly drumming with global BPM conducting
// Here we make our BPM instance that controls tempo
BPM tempo;
tempo.tempo(120.0);

// Add in instruments one at a time, musically
Machine.add(me.dir() + "/kick.ck") => int kickID;
8.0 * tempo.quarterNote => now;
Machine.add(me.dir() + "/snare.ck") => int snareID;
8.0 * tempo.quarterNote => now;
Machine.add(me.dir() + "/hihat.ck") => int hatID;
Machine.add(me.dir() + "/cowbell.ck") => int cowID;
8.0 * tempo.quarterNote => now;
Machine.add(me.dir() + "/clap.ck") => int clapID;
8.0 * tempo.quarterNote => now;

// Now have some fun with tempo
<<<"Set tempo to 80BPM">>>;
80.0 => float newTempo;
tempo.tempo(newTempo);
8.0 * tempo.quarterNote => now;

<<<"Set tempo to 160BPM">>>;
160.0 => newTempo;
tempo.tempo(newTempo);
8.0 * tempo.quarterNote => now;

/* If you want to run OTFBPM.ck to change tempo
   as these run, then comment out the lines below*/
   
<<<"Gradually decrease tempo">>>;
while (newTempo > 60.0) {
    newTempo - 20 => newTempo;
    tempo.tempo(newTempo);
    <<<"tempo = ", newTempo>>>;
    4.0 * tempo.quarterNote => now;
}

// Bring out the instruments, gradually
Machine.remove(kickID);
8.0 * tempo.quarterNote => now;
Machine.remove(snareID);
Machine.remove(hatID);
8.0 * tempo.quarterNote => now;
Machine.remove(cowID);
8.0 * tempo.quarterNote => now;
Machine.remove(clapID);