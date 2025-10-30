if(keyboard_check_pressed(vk_escape))
{
	game_end();
}

if(keyboard_check_pressed(vk_anykey) and room == r_start)
{
	room_goto_next();
}

