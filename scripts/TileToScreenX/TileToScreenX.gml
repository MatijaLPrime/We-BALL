// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TileToScreenX(argument0,argument1){
	var tX = argument0;
	var tY = argument1;

	return ((tX-tY) * TILE_W*0.5) + SCREEN_W *0.5;
}