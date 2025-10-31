// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_laser(){
	can_shoot = 0;
	alarm[0] = 20; //reload speed
	if(ammo_laser > 0)
	{
		ammo_laser -= 1;
		if(right)
		{
			tracer = instance_create_layer(x+weapon_modx,y+weapon_mody,"att",o_tracer_player);
			obj = instance_create_layer(x+weapon_modx,y+weapon_mody,"att",o_laser_player);
			obj.image_angle = point_direction(x+weapon_modx,y+weapon_mody,tracer.x,tracer.y);
			obj.image_xscale = point_distance(x+weapon_modx,y+weapon_mody,tracer.x,tracer.y);
		}else{
			tracer = instance_create_layer(x-weapon_modx,y+weapon_mody,"att",o_tracer_player);
			obj = instance_create_layer(x-weapon_modx,y+weapon_mody,"att",o_laser_player);
			obj.image_angle = point_direction(x-weapon_modx,y+weapon_mody,tracer.x,tracer.y);
			obj.image_xscale = point_distance(x-weapon_modx,y+weapon_mody,tracer.x,tracer.y);
		}
	}
}