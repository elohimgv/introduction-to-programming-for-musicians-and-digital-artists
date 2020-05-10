// Simple Class to show data access
public class TestData {
    1 => int myInt;
    0.0 => float myFrac;
    
    // A simple function that adds the data
    function float sum() {
        return myInt + myFrac;
    }
}

// Make one of our new test
TestData d;

<<<d.myInt, d.myFrac, d.sum()>>>;

// Change the data, just like we would variables
3 => d.myInt;
0.141592 => d.myFrac;

// Check to show that everyting changed
<<<d.myInt, d.myFrac, d.sum()>>>;