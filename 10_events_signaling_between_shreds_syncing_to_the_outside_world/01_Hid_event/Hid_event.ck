// Declare a new Hid object
Hid myHid;
// Message to convey data from Hid device
HidMsg msg;

// Device number: which keyboard to open
0 => int device;

// Open keyboard; or exit if fail to open
if (!myHid.openKeyboard(device)) {
    <<<"Can't open this device!! ", "Sorry">>>;
    me.exit();
}

// Print status of open keyboard Hid
<<< "Keyboard '" + myHid.name() + "' ready", "">>>;
// Testing the keyboard Hid
// Impulse keyboard "clicker"
Impulse imp => dac;

// Infinte even loop
while(true) {
    // Wait for event
    myHid => now;
    
    // Get message(s)
    while (myHid.recv(msg)) {
        // Process only key (button) downs events
        if (msg.isButtonDown()) {
            // Print ascii value and make a click
            <<<"Key DOWN:", msg.ascii>>>;
            5 => imp.next;
            // Key (button) up
        } else {
            // Do nothing for now
        }
    }
}
