if (obj_player.hp < obj_player.hpMax)
{
	obj_player.hp += obj_player.hpMax - obj_player.hp
}

audio_play_sound(snd_hp, 1, 0)

instance_destroy()