/// @description Insert description here
// You can write your code in this editor
switch(room)
{
	case r_lvl2_cave4:
		obj_player.x -= 2450
		obj_player.y -= 10
		room_goto(r_lvl2_cave_boss)
	break;
	
	case r_lvl2_cave_boss:
		obj_player.x += 2450
		obj_player.y += 200
		room_goto(r_lvl2_cave4)
	break;
}
global.inter = 0





