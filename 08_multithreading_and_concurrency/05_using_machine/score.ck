// Example of using Machine functions
// by Sporkie Griswold, June 2014

Machine.add(me.dir()+"/Listing8.1.ck") => int foobarID;
2.0::second => now;
Machine.add(me.dir()+"/Listing8.2.ck") => int drumnbassID;
6.0::second => now;
Machine.add(me.dir()+"/Listing8.3.ck") => int modalbendID;
4.0::second => now;
Machine.remove(modalbendID); // Remove Listing 8.3.ck
2.0::second => now;
Machine.replace(foobarID, me.dir()+"/Listing8.3.ck") => modalbendID;
4.0::second => now;
Machine.remove(modalbendID);