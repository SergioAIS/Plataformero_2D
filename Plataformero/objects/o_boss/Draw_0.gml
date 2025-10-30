switch(state)
{
	case "prepare_att":
		sprite_index = s_boss_stand;
	break;
	case "shoot_laser":
	case "shoot_misil":
		sprite_index = s_boss_shoot;
	break;
	case "prepare_dash":
		sprite_index = s_boss_dash_prep;
	break;
	case "dash":
		sprite_index = s_boss_dash;
	break;
	case "prepare_jump":
		sprite_index = s_boss_jump_prep;
	break;
	case "jump":
		sprite_index = s_boss_jump;
	break;
}
 
if(side_right)
{
	image_xscale = 1;
}
else
{
	image_xscale = -1;
}
 
mask_index = s_player_mask;
 
draw_self();