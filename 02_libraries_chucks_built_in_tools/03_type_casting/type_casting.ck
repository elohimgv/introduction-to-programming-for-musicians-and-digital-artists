// Author: Elohim Guevara
// Date: October 23, 2019
// patch name: type_casting.ck
// description: Convert data types
// like float to int.

230 => int myIntFreq;
// int to float
myIntFreq => float myFloatFreq;
<<< "float value: ",myFloatFreq >>>;

// float to int
230.5 => Std.ftoi => myIntFreq;
<<< "int value: ",myIntFreq >>>;

