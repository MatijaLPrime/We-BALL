/// @description Insert description here
// You can write your code in this editor
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
keyE = keyboard_check(ord("E"));

inputDirection = point_direction(0, 0, keyRight - keyLeft, keyDown - keyUp);
inputMagnitude = (keyRight - keyLeft != 0) or (keyDown - keyUp != 0);
if(global.isSlowed)
	inputMagnitude *= 0.3;

if(keyUp && keyLeft || keyUp && keyRight || keyDown&&keyRight || keyDown&&keyLeft){
	inputMagnitude*= 0.95;
}

// Movement
if(!global.isInputDisabled){
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	x += hSpeed;
	y += vSpeed;
}
var tile_x = ScreenToTileX(x, y);  // Convert player's screen x, y to tile coordinates
var tile_y = ScreenToTileY(x, y);

// Get the tilemap layer
var tileMap = layer_tilemap_get_id("Map");

// Get the tile ID at the player's position
var tileId = tilemap_get(tileMap, tile_x, tile_y);

if (global.roomSwitch) {
    show_debug_message("Room switched to: " + string(room));
    global.roomSwitch = false;  // Reset the flag for next room switch
}

if (playerHP > maxHP){
    playerHP = 20;
}
if (attack == true){
    if(mouse_check_button_pressed(1)){
		 // Calculate the player's world position by removing camera offset

        // Calculate the aiming direction using the adjusted player world coordinates
        //var Direction = point_direction(playerWorldX, playerWorldY, mouse_x, mouse_y);

        // Create the magic ball at the player's position
        var BALL = instance_create_layer(oPlayer.x, oPlayer.y, layer, oMagicBall);

        // Set the depth of the ball to make it appear at the bottom (optional)
        if (instance_exists(BALL)) {
            BALL.depth = 0;  // Adjust depth as needed
        }
        attack = false;
    }
}
else if (attack == false){
    count--;
}

if (count == 0){
    count = 60;
    attack = true;
}

if (can_do_flashlight){
    if(keyE){
        if(flashlight_is_on){
            flashlight_is_on = false;
        }
        else if (flashlight_is_on == false){
            flashlight_is_on = true;
        }
        can_do_flashlight = false;
    }
}
else if (can_do_flashlight == false){
    flashlight_count -- ;
}

if (flashlight_count == 0){
    flashlight_count = 5;
    can_do_flashlight = true;
}

show_debug_message("Player position: " + string(oPlayer.x) + ", " + string(oPlayer.y));
show_debug_message("Mouse position: " + string(mouse_x) + ", " + string(mouse_y));


//show_debug_message("I ve steped on tile:" + string(tile_x) + "," + string(tile_y));
/*if(keyLeft || keyRight || keyUp || keyDown){
	show_debug_message("Player coordinates:" +  string(x) + " " + string(y + sprite_height/2));
	var collisonRec = DrawIsometricRec(oHouse.x,oHouse.y + oHouse.sprite_height/4,oHouse.sprite_width * 0.9,oHouse.sprite_height/2,c_black);
	show_debug_message("Rectangle coordinates:" + string(collisonRec));
}*/
// Check if the player stepped on a specific tile
/*if (tileId == 2) {
    show_debug_message("I’ve stepped on tile 3!");
    room_goto(Room2);  // Go to Room2 if on the desired tile
}*/