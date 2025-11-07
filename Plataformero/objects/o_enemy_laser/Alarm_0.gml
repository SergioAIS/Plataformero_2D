/// @description Shoot

obj = instance_create_layer(x,y-32,"att",o_super_laser);

obj.image_angle = point_direction(x,y-32,tracer.x,tracer.y);
obj.image_xscale = point_distance(x,y-32,tracer.x,tracer.y);

alarm[1] = reload_speed;

hspeed = x_speed_temp;
if(hspeed > 0) image_xscale = 1; else image_xscale = -1;

