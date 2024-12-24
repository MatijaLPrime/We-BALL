// Initialize variables
// Initialize variables
isBumping = false;      // Whether the player is currently bumping
bumpTimer = 0;          // Timer to count down bump duration
bumpTime =	10;         // The duration of the bump effect (in steps, 2 seconds)
bumpDistance = 3;       // Distance the player will bump back
slideSpeed = 1;       // Speed of sliding after bump (controlled and smooth)
global.isSlowed = false;       // Whether the player is in the slowed state after the bump
slowTimer = 0;          // Timer for the slow duration
slowTime = 60;    
global.isInputDisabled = false;