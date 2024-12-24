// Initialize camera
// Camera setup
// Set initial camera settings
cam = view_camera[0];
follow = oPlayer; // The player object to follow
bufferFactor = 0.05; // Smoothing factor for camera transition (smaller values for slower transitions)
directionOffset = 0; // To store the offset based on direction
lastDirection = 0; // Store the last direction (0 = no movement, or you can use a direction range)
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;

x = follow.x - view_w_half; // Starting X position of the camera
y = follow.y - view_h_half; // Starting Y position of the camera



