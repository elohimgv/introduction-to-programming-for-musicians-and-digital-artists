// score.ck, endless loop to add some BPM users 
while (true){
    Machine.add(me.dir() + "/useBPM2.ck");
    1.0::second => now;
    Machine.add(me.dir() + "useBPM3.ck");
    2.0::second => now;
}