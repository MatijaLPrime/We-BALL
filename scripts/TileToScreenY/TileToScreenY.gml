// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TileToScreenY(argument0,argument1){
	var tX = argument0;
	var tY = argument1;

	return ((tX+tY) * TILE_H*0.5) + SCREEN_H*0.25;
}