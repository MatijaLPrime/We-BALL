if !surface_exists(surf)
    {
    var _cw = camera_get_view_width(view_camera[0]);
    var _ch = camera_get_view_height(view_camera[0]);
    surf = surface_create(_cw, _ch);
    surface_set_target(surf);
    draw_set_colour(c_black);
    draw_set_alpha(0);
    draw_rectangle(0, 0, _cw, _ch, false);
    surface_reset_target();
    }
else {
	if (surface_exists(surf)) {
		var _cw = camera_get_view_width(view_camera[0]);
		var _ch = camera_get_view_height(view_camera[0]);
		var _cx = camera_get_view_x(view_camera[0]);
		var _cy = camera_get_view_y(view_camera[0]);
		var angle_to_mouse = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);
		if(instance_exists(oBoss))
			var angle_to_player = point_direction(oBoss.x, oBoss.y, oPlayer.x, oPlayer.y);
		surface_set_target(surf);
		draw_set_color(c_black);
		draw_set_alpha(0.70);
		draw_rectangle(0, 0, _cw, _ch, 0);
		gpu_set_blendmode(bm_subtract);
		with (oLightParent)
		{
			var _sw = sprite_width / 2;
			var _sh = sprite_height /8;

			switch(object_index){

			case oPlayer:{

				if (oPlayer.flashlight_is_on){

					draw_sprite_ext(sLight, 0, x - _cx , y - _sh - _cy, 1, 1, angle_to_mouse - 90, c_white, 1);
					break;
				}

				else{
					break;
				}
			}
			case oBoss:{

			draw_sprite_ext(sBossLight, 0, x - _cx , y - _sh - _cy, 1, 1, angle_to_player - 90, c_white, 1);
			break;

			}
			}
		}

		gpu_set_blendmode(bm_normal);
		draw_set_alpha(1);
		surface_reset_target();
		draw_surface(surf, _cx, _cy);
	}
}
