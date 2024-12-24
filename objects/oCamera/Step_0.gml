if (instance_exists(follow)) {
    // Convert player position to screen coordinates
    var playerScreenX = TileToScreenX(follow.x, follow.y);
    var playerScreenY = TileToScreenY(follow.x, follow.y);

    // Set the target position directly around the player
    var movementDirection = point_direction(follow.x, follow.y, follow.x + follow.hSpeed, follow.y + follow.vSpeed);

    // If the player is moving, update the camera direction
    if (follow.hSpeed != 0 || follow.vSpeed != 0) {
        if (movementDirection != lastDirection) {
            // Determine the direction offset based on the movement direction
            if (movementDirection >= 135 && movementDirection < 225) {
                // Moving down (largest offset)
                directionOffset = -80; // Bigger offset for downward movement
            } else if (movementDirection >= 225 || movementDirection < 45) {
                // Moving right (large offset)
                directionOffset = 140; // Significantly larger offset for right movement
            } else if (movementDirection > 45 && movementDirection < 135) {
                // Moving left (large offset but smaller than right)
                directionOffset = -60; // Larger offset for left movement
            } else {
                // Moving up (smallest offset)
                directionOffset = 30; // Smaller offset for upward movement
            }

            // Handle diagonal movement offsets by combining horizontal and vertical offsets
            if (movementDirection > 45 && movementDirection < 135) {
                if (movementDirection >= 45 && movementDirection <= 90) {
                    // Up + Left (average of up and left offsets)
                    directionOffset = (directionOffset + -80) / 2; // Mixing up and left
                } else if (movementDirection > 90 && movementDirection < 135) {
                    // Up + Right (average of up and right offsets)
                    directionOffset = (directionOffset + 140) / 2; // Mixing up and right
                }
            } else if (movementDirection >= 225 && movementDirection < 315) {
                if (movementDirection >= 225 && movementDirection <= 270) {
                    // Down + Left (average of down and left offsets)
                    directionOffset = (directionOffset + -60)/2; // Mixing down and left
                } else if (movementDirection > 270 && movementDirection < 315) {
                    // Down + Right (average of down and right offsets)
                    directionOffset = (directionOffset + 140) / 2; // Mixing down and right
                }
            }
            lastDirection = movementDirection; // Update last direction
        }
    } else {
        // If stationary, retain the last direction offset
        directionOffset = directionOffset;
    }

    // Smooth camera transition with the calculated offset
    var targetX = follow.x - view_w_half + directionOffset;
    var targetY = follow.y - view_h_half;

    // Smoothly interpolate the camera's position to the target position
    x += (targetX - x) * bufferFactor;
    y += (targetY - y) * bufferFactor;

    // Declare variables for camera shake
    var shakeX = 0;
    var shakeY = 0;

    // Check if oBounderies is bumping
    if (oBounderies.isBumping) {
        // Define the intensity of the shake
        var shakeIntensity = 4; // Adjust this value for more or less shaking
        show_debug_message("Camera is shaking");

        // Generate random offsets for the shake
        shakeX = random_range(-shakeIntensity, shakeIntensity);
        shakeY = random_range(-shakeIntensity, shakeIntensity);

        // Apply shake directly to the camera's position
        x += shakeX;
        y += shakeY;
    }

    // Update the camera's position
    camera_set_view_pos(cam, x, y);
}
