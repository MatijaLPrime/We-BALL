/// @description Insert description here
// You can write your code in this editor
if (instance_exists(oPlayer)) {
    // Convert player position to tile coordinates using your isometric formulas
    var playerTileX = script_execute(ScreenToTileX,oPlayer.x,oPlayer.y);
    var playerTileY = script_execute(ScreenToTileY,oPlayer.x,oPlayer.y);
	
	var tileMap = layer_tilemap_get_id("Map");

	// Get the tile ID at the player's position
	var tileId = tilemap_get(tileMap, playerTileX, playerTileY);
    // Check if the player is on the switch tile (adjust these values as needed)
    if (tileId == 1) {  // Use your specific tile coordinates
        show_debug_message("Player is on the switch tile!");
		global.roomSwitch = true;
		global.spawnX = 3;
		global.spawnY = 10;
		
		if(room == Room1)
			alarm[0] = 1;
		else if(room == Room2)
			alarm[1] = 1;
        //room_goto(Room2); // Switch to the new room
		show_debug_message("Should be switchin");
    }
}