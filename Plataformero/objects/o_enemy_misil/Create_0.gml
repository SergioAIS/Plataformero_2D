
// stats ---------------------------------

hp = 30;
dmg = 20;

can_shoot = 1;
shoot_delay = 35;
reload_speed = 160;

range = 300;

// control/movimiento --------------------

x_speed = 1;
x_check = 11;
x_speed_temp = 0;

mask_index = s_player_mask;

if(irandom(1))
{
	hspeed = x_speed;
}
else
{
	hspeed = -x_speed;
	image_xscale = -1;
}
