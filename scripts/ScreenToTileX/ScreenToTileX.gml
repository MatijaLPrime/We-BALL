// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenToTileX(argument0,argument1){
	var sX = argument0 - (SCREEN_W * 0.5);
    var sY = argument1 - (SCREEN_H * 0.25);
	
	var tX = (sX / (TILE_W * 0.5) + sY / (TILE_H * 0.5)) / 2;
    return round(tX);
}