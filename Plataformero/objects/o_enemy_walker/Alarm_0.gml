/// @description Shoot
obj = instance_create_layer(x, y - 30, "att", o_enemy_shot)

audio_play_sound(snd_enemy_shot_1, 1, 0)

if (image_xscale == -1) obj.hspeed *= -1

alarm[1] = reloadSpeed

hspeed = xSpeedTemp

if (hspeed > 0) image_xscale = 1 else image_xscale = -1