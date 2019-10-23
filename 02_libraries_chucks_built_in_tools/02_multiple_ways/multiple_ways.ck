// Author: Elohim Guevara
// Date: October 23, 2019
// patch name: multiple_ways.ck
// description: Testing ways to  
// achive things like how to store  
// values using Standar Chuck Libraries.

// Two different ways //

// This
<<< Std.mtof(64) >>>;
// or this
<<< 64 => Std.mtof >>>;

64 => Std.mtof => float f;
<<< f >>>;

