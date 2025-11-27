/// @description Go to room
if (global.previous_room == r_start)
{
	room_goto(r_lvl1)
}
	else if (global.previous_room == r_lvl1)
	{
		room_goto(r_lvl2)
	} 
		else if (global.previous_room == r_lvl2_finish)
		{
			room_goto(r_lvl3)
		}
			else if (global.previous_room == r_lvl3)
			{
				room_goto(r_boss)
			}
		