/// @description Shoot
obj = instance_create_layer(x, y - 25, "att", o_enemy_shot)

if (image_xscale == -1) obj.hspeed *= -1

alarm[1] = reloadSpeed

hspeed = xSpeedTemp

if (hspeed > 0) image_xscale = 1 else image_xscale = -1