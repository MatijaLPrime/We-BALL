if (instance_exists(oPlayer)) {
 // Convert player position to tile coordinates
	var playerTileX = script_execute(ScreenToTileX, oPlayer.x, oPlayer.y);
    var playerTileY = script_execute(ScreenToTileY, oPlayer.x, oPlayer.y);

    // Get the tile ID at the player's current position
    var tileMap = layer_tilemap_get_id("Map");
    var tileId = tilemap_get(tileMap, playerTileX, playerTileY);

    // If the player is trying to move onto an unwalkable tile
    if ((tileId == 0 || tileId == 3) && !isBumping && !global.isInputDisabled) {  // '0' represents unwalkable
        var moveDirectionX = oPlayer.hSpeed;
        var moveDirectionY = oPlayer.vSpeed;

        // If moving, start the bump-back process
        if (moveDirectionX != 0 || moveDirectionY != 0) {
            isBumping = true;  // Start bumping
	        bumpTimer = bumpTime;  // Set bump duration
	        global.isInputDisabled = true;  // Disable input during bump

	        // Calculate the bump direction
	        bumpDirX = -moveDirectionX;  // Opposite of movement direction
	        bumpDirY = -moveDirectionY;  // Opposite of movement direction

	        // Normalize bump direction to ensure smooth sliding
	        var magnitude = point_distance(0, 0, bumpDirX, bumpDirY);
	        if (magnitude > 0) {
	            bumpDirX /= magnitude;
	            bumpDirY /= magnitude;
	        }
        }
    }
	
	if(isBumping){
		// Slide the player in the bump direction
	    oPlayer.x += bumpDirX * slideSpeed;
	    oPlayer.y += bumpDirY * slideSpeed;

	    // Countdown bump timer
	    bumpTimer -= 1;

	    // End the bump state after the timer expires
	    if (bumpTimer <= 0) {
	        isBumping = false;  // End bump state
	        global.isInputDisabled = false;  // Re-enable input
	        global.isSlowed = true;  // Activate slow state
	        slowTimer = slowTime;  // Set the slow duration
	    }
	}
	
	if (global.isSlowed) {
        // Slow the player's movement for the slow duration  // Reduce the movement speed (30% of normal)
        // Countdown slow timer
        slowTimer -= 1;

        // If slow time is over, reset slowdown
        if (slowTimer <= 0) {
            global.isSlowed = false;  // Disable slow state
        }
    }
	
}

function bump(){
	var moveDirectionX = oPlayer.hSpeed;
    var moveDirectionY = oPlayer.vSpeed;

        // If moving, start the bump-back process
    if (moveDirectionX != 0 || moveDirectionY != 0) {
        isBumping = true;  // Start bumping
	    bumpTimer = bumpTime;  // Set bump duration
	    global.isInputDisabled = true;  // Disable input during bump

	        // Calculate the bump direction
	    bumpDirX = -moveDirectionX;  // Opposite of movement direction
	    bumpDirY = -moveDirectionY;  // Opposite of movement direction

	        // Normalize bump direction to ensure smooth sliding
	    var magnitude = point_distance(0, 0, bumpDirX, bumpDirY);
	    if (magnitude > 0) {
	       bumpDirX /= magnitude;
	       bumpDirY /= magnitude;
	    }
    }
	
	if(isBumping){
		// Slide the player in the bump direction
	    oPlayer.x += bumpDirX * slideSpeed;
	    oPlayer.y += bumpDirY * slideSpeed;

	    // Countdown bump timer
	    bumpTimer -= 1;

	    // End the bump state after the timer expires
	    if (bumpTimer <= 0) {
	        isBumping = false;  // End bump state
	        global.isInputDisabled = false;  // Re-enable input
	        global.isSlowed = true;  // Activate slow state
	        slowTimer = slowTime;  // Set the slow duration
	    }
	}
	
	if (global.isSlowed) {
        // Slow the player's movement for the slow duration  // Reduce the movement speed (30% of normal)
        // Countdown slow timer
        slowTimer -= 1;

        // If slow time is over, reset slowdown
        if (slowTimer <= 0) {
            global.isSlowed = false;  // Disable slow state
        }
    }
	
		
}

function knockBack(object){
	object.x -= 40;
	object.y -= 40;
	object.speed *= 0.3;
}