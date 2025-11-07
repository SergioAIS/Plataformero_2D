
if(!obj_player.pick_heavy)
{
	obj_player.pick_heavy = 1;
	obj_player.weapon = "heavy";
}

obj_player.ammo_heavy = 20;

audio_play_sound(snd_rocket_launcher_metal, 1, 0)

instance_destroy();
