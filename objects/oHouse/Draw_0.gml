/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, alpha);
draw_set_alpha(1); // Reset alpha to avoid affecting other objects
//DrawIsometricRec(x,y + sprite_height/4,sprite_width * 0.9,sprite_height/2,c_black);
//show_debug_message("Drawing house with alpha: " + string(alpha));
