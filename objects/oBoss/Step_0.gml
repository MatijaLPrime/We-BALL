if (count == 0){
    count = attackSpeed;
}


if (distance_to_object(oPlayer) < agroRadius){
    agro = true;
    direction = point_direction(oBoss.x,oBoss.y, oPlayer.x,oPlayer.y);
    speed = 0.05;

}
else if (distance_to_object(oPlayer) > agroRadius){
    agro = false;
    direction = 0;
    speed = 0; 
}


if (agro = true and count == attackSpeed){
	show_debug_message("I entered debug");
    //audio_play_sound(snd_fireballCast, 0, false);
    if(instance_create_layer(oBoss.x,oBoss.y,layer, oFireBall)){
		show_debug_message("I have created");
	}
	else show_debug_message("I have not created");
	
	show_debug_message(string(oFireBall.ball_x));
}
count --;

if (hp <= 500 and distance_to_object(oPlayer) < agroRadius){
    speed = 1.5;
    //oFireBall.speed = 7;
    attackSpeed = 60;
}

if (hp <= 0){
    bossAlive = false;
	instance_destroy();
}