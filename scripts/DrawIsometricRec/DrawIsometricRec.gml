// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DrawIsometricRec(x, y, width, height, color){
 // Set the color for the rectangle
    if (argument_count > 4) draw_set_color(color);
    else draw_set_color(c_white);

    // Convert the width and height into isometric space
    var half_width = width / 2;
    var half_height = height / 2;

    // Calculate the four corners in isometric space
    var top_x = x;
    var top_y = y - half_height;

    var right_x = x + half_width;
    var right_y = y;

    var bottom_x = x;
    var bottom_y = y + half_height;

    var left_x = x - half_width;
    var left_y = y;

    // Draw the isometric rectangle

    draw_line(top_x, top_y, right_x, right_y);
    draw_line(right_x, right_y, bottom_x, bottom_y);
    draw_line(bottom_x, bottom_y, left_x, left_y);
    draw_line(left_x, left_y, top_x, top_y);
	
	return {
        top_left: [top_x, top_y],
        top_right: [right_x, right_y],
        bottom_left: [left_x, left_y],
        bottom_right: [bottom_x, bottom_y]
    };
}