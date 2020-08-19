// Hid object
Hid hi;
// Message to convey data from Hid device
HidMsg msg;

// Device number: which keyboard to open
0 => int device;

// Open keyboard; or exit if fail to open
if (!hi.openKeyboard(device)) me.exit();
    // Print a message!
    <<<"Keyboard '" + hi.name() + "' ready", "">>>;

// Sound chain for Hid keyboard controlled organ
BeeThree organ => JCRev r => dac;

// Infinite event loop
while (true) {
    // Wait for event
    hi => now;
    
    // Get message
    while (hi.recv(msg)) {
        // Button (key) down, play a note
        if (msg.isButtonDown()) {
            Std.mtof(msg.ascii) => organ.freq;
            1 => organ.noteOn;
        } else { // Button up, noteOff
            // Deactivate the note
            0 => organ.noteOff;
        }
    }
}
