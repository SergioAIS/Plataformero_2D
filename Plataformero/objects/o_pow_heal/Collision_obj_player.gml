if (obj_player.hp < obj_player.hpMax)
{
	obj_player.hp += obj_player.hpMax - obj_player.hp
}

	obj = instance_create_layer(x, y, "part_front", o_float_text)
	obj.type = "hp"
	obj.value = "HP +"
	
audio_play_sound(snd_hp, 1, 0)

instance_destroy()