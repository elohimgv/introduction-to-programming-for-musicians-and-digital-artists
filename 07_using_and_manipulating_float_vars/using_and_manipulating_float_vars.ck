// Author: Elohim Guevara
// Date: October 10, 2019
// patch name: vars_and_math.ck
// description: Learning to play with variables
// and doing math in patch.

// Declare and initialize a float 
// variable to hold twinkle pitch
220 => float twinkle;

// Doing math to derive your 2nd 
// twinkle pitch from the first one
1.5 * twinkle => float twinkle2;

// Doing math to derive lit pitch  
// from pitch twinkle
1.6818 * twinkle => float lit; 

// Doing math to derive tle pitch  
// from pitch twinkle2
1.2585 * twinkle2 => float tle;

// New pitch an octave above twinkle
2 * twinkle => float octave; 

<<< twinkle, twinkle2, lit, tle, octave >>>;