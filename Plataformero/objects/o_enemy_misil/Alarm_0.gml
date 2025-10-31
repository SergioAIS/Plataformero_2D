/// @description Shoot

instance_create_layer(x,y-40,"att",o_misil);

alarm[1] = reload_speed;

hspeed = x_speed_temp;
if(hspeed > 0) image_xscale = 1; else image_xscale = -1;
