// Factorial
fun int factorial(int x) {
    if (x <= 1) {
        // when we reach here, functions ends
        return 1;
    } else {
        // recursive function calls itself
        return (x*factorial(x-1));
    }
}

// Main program, call factorial
<<<factorial(4)>>>;