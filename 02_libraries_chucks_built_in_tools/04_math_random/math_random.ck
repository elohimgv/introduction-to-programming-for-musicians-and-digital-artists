// Author: Elohim Guevara
// Date: October 23, 2019
// patch name: math_random.ck
// description: Random integer 
// number generation simulates 
// the roll of a die.

while (true) {
    <<< "Dice Roll =", Math.random2(1,6) >>>;
    second / 2 => now;
}