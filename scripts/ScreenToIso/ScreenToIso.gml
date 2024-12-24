// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenToIso(argument0,argument1){
	var isoX = (argument0 - argument1) / 2;
    var isoY = (argument1 + argument1) / 4;
    return [isoX, isoY];
}