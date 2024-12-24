/// @description Insert description here
// You can write your code in this editor
// Initialize speed and other variables
hSpeed = 0;
vSpeed = 0;
speedWalk = 2;
attack = true;
bossAttackCount = 120;
playerHP = 200;
maxHP = 200;
count = 60;

healthBarWidth = 200;
healthBarHeight = 50;

healthBarX = x;
helthBarY = y;

if (!variable_global_exists("spawnX")) global.spawnX = undefined;
if (!variable_global_exists("spawnY")) global.spawnY = undefined;
if(is_undefined(global.spawnX) || is_undefined(global.spawnY)){
	global.spawnX = 3 // Tile X coordinate
	global.spawnY = 6; // Tile Y coordinate
	x = script_execute(TileToScreenX, global.spawnX, global.spawnY);
	y = script_execute(TileToScreenY, global.spawnX, global.spawnY);
	
}
global.roomSwitch = false;

// Convert tile position (3,6) to world coordinates
show_debug_message("oPlayer created. Setting spawn position...");
flashlight_is_on = true;
flashlight_count = 5;
can_do_flashlight = true;

