
if(!obj_player.pick_machine)
{
	obj_player.pick_machine = 1;
	obj_player.weapon = "machine";
}

obj_player.ammo_machine = 50;

audio_play_sound(snd_power_up, 1, 0)

instance_destroy();
