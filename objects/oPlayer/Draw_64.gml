//draw_sprite(Sprite17,0,healthbar_x,healthbar_y);
//draw_sprite_stretched(Sprite15,0,healthbar_x,healthbar_y,(playerHP/maxHP)* healthbar_width,healthbar_height);
//draw_sprite(Sprite16,0,healthbar_x,healthbar_y);

var pc;
pc = (playerHP/maxHP) * 100;
draw_healthbar(100,650,300, 680, pc, c_black, c_red, c_lime, 0, true, true);