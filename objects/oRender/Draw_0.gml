/// @description Insert description here
// You can write your code in this editor
var screenX, screenY, tileX, tileY, tileIndex,tileZ;
for(var tX = 0 ;tX < MAP_W; tX++){
	for(var tY = 0;tY < MAP_H; tY++){
		var xPos = view_xview[0] + 10;  // 10 pixels from the left of the view
		var yPos = view_yview[0] + 10; 
		//draw_text(xPos, yPos, "FPS: " + string(fps));
		//show_debug_message("Processing tile at tX: " + string(tX) + ", tY: " + string(tY));

        var tileData = global.theMap[# tX, tY];
        if (is_undefined(tileData)) {
            show_debug_message("tileData is undefined at tX: " + string(tX) + ", tY: " + string(tY));
            continue;
        }

        screenX = script_execute(TileToScreenX,tX,tY);
        screenY = script_execute(TileToScreenY,tX,tY);
		
		
		//show_debug_message(string(screenX) + " " + string(screenY));
        tileIndex = tileData[TILE.SPRITE];
        tileZ = tileData[TILE.Z];

		if(tileIndex!=0){
			if(tileIndex == 1)
				draw_sprite(Sprite2, tileIndex - 1, screenX, screenY + tileZ);
			else if(tileIndex == 2)
				draw_sprite(Sprite1, tileIndex - 1, screenX, screenY + tileZ);
			else if(tileIndex == 3)
				draw_sprite(Sprite5, tileIndex - 1, screenX, screenY - 25);
				
			//draw_text(screenX,screenY,string(tX) + "," +string(tY));
		}
		
		
	}
}