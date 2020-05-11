// initialize.ck manages classes and files
// add public classes first
Machine.add(me.dir() + "/BPM.ck");

// Then add instruments, scores, etc.
Machine.add(me.dir() + "/useBPM.ck");
Machine.add(me.dir() + "/useBPM2.ck");

// Wait a bit, then add some more!
4.0::second => now;
Machine.add(me.dir() + "/score.ck");