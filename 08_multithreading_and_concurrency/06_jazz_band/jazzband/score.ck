// score.ck

// Start piano
Machine.add(me.dir() + "/paino.ck") => int pianoID;
4.8::second => now;

// Start drums
me.dir() + "/drums.ck" => string drumsPath;
Machine.add(drumsPath) => int drumsID;
4.8::second => now;

// Start bass
Machine.add(me.dir() + "/bass.ck") => int bassID;
4.8::second => now;

// Start flute solo
Machine.add(me.dir() + "/flute.ck") => int fluteID;
4.8::second => now;

// Remove drums
Machine.remove(drumsID);
4.8::second => now;

// Add drums back in
Machine.add(drumsPath) => drumsID;