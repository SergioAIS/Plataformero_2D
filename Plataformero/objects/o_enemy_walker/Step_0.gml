
event_inherited();

// attacks --------------------------------------

if(can_shoot)
{
	if( (abs(obj_player.x - x) < range_x ) and (abs(obj_player.y - y) < range_y ) )
	{
		x_speed_temp = hspeed;
		hspeed = 0;
		can_shoot = 0;
		alarm[0] = shoot_delay;
	}
}

// checks ---------------------------------------

if(hspeed == 0)
{
	if(obj_player.x > x) image_xscale = 1; else image_xscale = -1;
}

if(hspeed > 0)
{
	if(place_meeting(x+x_check,y,o_terrain))
	{
		scr_flip();
	}
	else
	{
		if(collision_rectangle(x+18,y,x+20,y+2,o_terrain,0,1) == noone)
		{
			scr_flip();
		}
	}
}

if(hspeed < 0)
{
	if(place_meeting(x-x_check,y,o_terrain))
	{
		scr_flip();
	}
	else
	{
		if(collision_rectangle(x-18,y,x-20,y+2,o_terrain,0,1) == noone)
		{
			scr_flip();
		}
	}
}
