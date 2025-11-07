
if(!obj_player.pick_laser)
{
	obj_player.pick_laser = 1;
	obj_player.weapon = "laser";
}

obj_player.ammo_laser= 15;

audio_play_sound(snd_lasergun_metal, 1, 0)

instance_destroy();
