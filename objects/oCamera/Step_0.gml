// Variables for Dead Zone Size
var deadZoneWidth = view_w / 8;  // 25% of view width
var deadZoneHeight = view_h / 8; // 25% of view height

// Variables for Smooth Transition (smoothing factor)
var smoothFactor = 0.1;  // Smoothing factor for the camera transition (adjust as needed)

// Calculate the mouse position relative to the player
var mouseRelativeX = mouse_x - follow.x;
var mouseRelativeY = mouse_y - follow.y;

// Calculate the direction offsets based on the mouse position
var offsetX = 0;
var offsetY = 0;

// Check if the mouse is outside the dead zone (either horizontally or vertically)
if (abs(mouseRelativeX) > deadZoneWidth) {
    if (mouseRelativeX > 0) {
        offsetX = (mouseRelativeX - deadZoneWidth) * 0.7; // Adjust for right side (multiply by scale factor)
		oPlayer.sprite_index = player;
    } else {
        offsetX = (mouseRelativeX + deadZoneWidth) * 0.7;
		oPlayer.sprite_index = playerLeft;// Adjust for left side
    }
}

if (abs(mouseRelativeY) > deadZoneHeight) {
    if (mouseRelativeY > 0) {
        offsetY = (mouseRelativeY - deadZoneHeight) * 0.5;  // Adjust for bottom side (multiply by scale factor)
    } else {
        offsetY = (mouseRelativeY + deadZoneHeight) * 0.5;  // Adjust for top side
    }
}

// Target camera position based on player and calculated offsets
var targetX = follow.x - view_w / 2 + offsetX;
var targetY = follow.y - view_h / 2 + offsetY;

// Optionally: Add extra padding at the map's edges, if necessary
// Clamp the camera to prevent it from going out of bounds
var mapWidth = 700;  // Your map width
var mapHeight = 700; // Your map height

// Adjusting the clamp to allow for the camera to move outside the map boundaries, if needed
targetX = clamp(targetX, 0, mapWidth - view_w);
targetY = clamp(targetY, 0, mapHeight - view_h);

// Smoothly transition to the target position
x += (targetX - x) * smoothFactor;
y += (targetY - y) * smoothFactor;

// Apply camera shake logic (optional)
var shakeX = 0;
var shakeY = 0;

if (oBounderies.isBumping) {
    var shakeIntensity = 4;  // Adjust intensity as needed
    shakeX = random_range(-shakeIntensity, shakeIntensity);
    shakeY = random_range(-shakeIntensity, shakeIntensity);

    // Apply shake to the camera's position
    x += shakeX;
    y += shakeY;
}

// Update the camera's position
camera_set_view_pos(cam, x, y);
