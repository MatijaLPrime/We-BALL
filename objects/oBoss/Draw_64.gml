var viewport_width = view_wport[0];
var viewport_height = view_hport[0];

var health_bar_position_left = viewport_width/2 - 100;
var health_bar_position_right = health_bar_position_left +200;

draw_healthbar(health_bar_position_left,50,health_bar_position_right, 80,hp/maxHP*100, c_black, c_red, c_red, 0, true, true);

if(oBoss.hp <= 0){
    bossAlive = false;
}