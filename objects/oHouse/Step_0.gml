/// @description Insert description here
// You can write your code in this editor
if (instance_exists(oPlayer)) {
    var playerIso = script_execute(ScreenToIso, oPlayer.x, oPlayer.y);
    var houseIso = script_execute(ScreenToIso, x, y);

    // Calculate distances
    var yDistance = houseIso[1] - playerIso[1]; // Positive if player is behind the house
    var proximityDistance = point_distance(playerIso[0], playerIso[1], houseIso[0], houseIso[1]);

    // Thresholds
    var transparencyThreshold = 60; // Maximum distance to fade transparency

    if (yDistance > 0 && proximityDistance < transparencyThreshold) {
        // Closer means more transparent
        alpha = lerp(0.5, 1, proximityDistance / transparencyThreshold);
    } else {
        alpha = 1; // Fully opaque if not behind or too far
    }
}


if(instance_exists(oHouse)){
	var collisonRec = DrawIsometricRec(x,y + sprite_height/4,sprite_width * 0.9,sprite_height/2,c_black);
	if(CheckPlayerCollision(collisonRec,oPlayer.x, oPlayer.y + oPlayer.sprite_height/2)){
		oBounderies.bump();
	}
}
//show_debug_message("Checking collision at player position: (" + string(oPlayer.x) + ", " + string(oPlayer.y)+")");


/*show_debug_message("House coordinates:" + string(x) + " " + string(y));
show_debug_message("House heigth and width:" + string(sprite_height) + " " + string(sprite_width));*/
