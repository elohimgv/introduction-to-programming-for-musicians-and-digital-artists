// Author: Elohim Guevara
// Date: October 10, 2019
// patch name: vars_and_math.ck
// description: practice declaring 
// integer varialbes and do math

// declare an integer value
int myPitch;

// store a value in it
210 => myPitch;

// another way to initialize integers
//210 => int myPitch;

// print it out 
<<< myPitch >>>;

// arithmetic with integers
// add or subtract
myPitch + myPitch - 100 => int anotherPitch;
// multiply
2 * myPitch => int higherPitch;
// divide
myPitch / 2 => int lowerPitch;
// print them all out
<<< myPitch, anotherPitch, higherPitch, lowerPitch >>>;