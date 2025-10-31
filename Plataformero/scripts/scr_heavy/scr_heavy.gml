// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_heavy(){
	can_shoot = 0;
	alarm[0] = 35; //reload speed
	if(ammo_heavy > 0)
	{
		ammo_heavy -= 1;
		if(right)
		{
			obj = instance_create_layer(x+weapon_modx,y+weapon_mody,"att",o_heavy);
		}
		else
		{
			obj = instance_create_layer(x-weapon_modx,y+weapon_mody,"att",o_heavy);
			obj.hspeed *= -1;
			obj.image_xscale = -1;
		}
	}
}