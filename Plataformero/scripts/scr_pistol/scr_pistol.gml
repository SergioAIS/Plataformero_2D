// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pistol(){
	can_shoot = 0;
	alarm[0] = 35; //reload speed
	if(right)
	{
		obj = instance_create_layer(x+weapon_modx,y+weapon_mody,"att",o_pistol);
	}
	else
	{
		obj = instance_create_layer(x-weapon_modx,y+weapon_mody,"att",o_pistol);
		obj.image_xscale = -1;
		obj.hspeed *= -1;
	}
}