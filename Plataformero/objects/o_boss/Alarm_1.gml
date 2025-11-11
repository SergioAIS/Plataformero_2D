/// @description Attacks

switch(state)
{
	case "shoot_laser":		
		obj = instance_create_layer(x,y-28,"att",o_enemy_shot);
		if(image_xscale == 1) obj.hspeed *= -1;
	break;
	case "shoot_misil":
		instance_create_layer(x,y-40,"att",o_misil);
	break;
}