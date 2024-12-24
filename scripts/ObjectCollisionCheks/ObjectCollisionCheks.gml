function CheckPlayerCollision(rectangle, player_x, player_y) {
    // Declare and initialize player_was_inside if it doesn't exist
    if (!variable_instance_exists(self, "player_was_inside")) {
        player_was_inside = false;
    }

    // Rectangle's corner points (diamond-shaped, rotated rectangle)
    var top_left = rectangle.top_left;
    var top_right = rectangle.top_right;
    var bottom_left = rectangle.bottom_left;
    var bottom_right = rectangle.bottom_right;

    // Calculate cross products for each edge
    var cp1 = cross_product(top_left[0], top_left[1], top_right[0], top_right[1], player_x, player_y - 10);
    var cp2 = cross_product(top_right[0], top_right[1], bottom_right[0], bottom_right[1], player_x, player_y - 12);
    var cp3 = cross_product(bottom_right[0], bottom_right[1], bottom_left[0], bottom_left[1], player_x, player_y);
    var cp4 = cross_product(bottom_left[0], bottom_left[1], top_left[0], top_left[1], player_x, player_y - 5);

    // Tolerance to handle floating-point imprecision
    var tolerance = 0.0000001;

    // Determine if player is inside the diamond
    var player_is_inside = (cp1 >= -tolerance && cp2 >= -tolerance && cp3 >= -tolerance && cp4 >= -tolerance);

    // Debug output
    /*show_debug_message("Cross Products: " + string(cp1) + ", " + string(cp2) + ", " + string(cp3) + ", " + string(cp4));
    show_debug_message("Player is inside: " + string(player_is_inside));*/
	
	return(player_is_inside);

    // Trigger on state change
    /*if (player_is_inside != player_was_inside) {
        if (player_is_inside) {
            show_debug_message("Player has crossed into the diamond-shaped rectangle!");
        } else {
            show_debug_message("Player has crossed out of the diamond-shaped rectangle!");
        }*/
    //}

    // Update state
    //player_was_inside = player_is_inside;
}

// Cross product function
function cross_product(x1, y1, x2, y2, px, py) {
    return (x2 - x1) * (py - y1) - (y2 - y1) * (px - x1);
}
