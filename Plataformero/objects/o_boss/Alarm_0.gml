/// @description State manager

switch(state)
{
	case "prepare_att":
		switch(irandom(1))
		{
			case 0:
				state = "shoot_laser";
				alarm[1] = 15;
				alarm[0] = 60;
			break;
			case 1:
				state = "shoot_misil";
				alarm[1] = 15;
				alarm[0] = 60;
			break;
		}
	break;
	case "shoot_laser":
	case "shoot_misil":
		switch(irandom(1))
		{
			case 0:
				state = "prepare_dash";
				alarm[0] = 35;
			break;
			case 1:
				state = "prepare_jump";
				alarm[0] = 35;
			break;
		}
	break;
	case "prepare_dash":
		state = "dash";
		if(side_right)
		{
			path_start(p_boss_dash_left,12,path_action_stop,0);
		}
		else
		{
			path_start(p_boss_dash_right,12,path_action_stop,0);
		}
	break;
	case "prepare_jump":
		state = "jump";
		if(side_right)
		{
			path_start(p_boss_jump_left,12,path_action_stop,0);
		}
		else
		{
			path_start(p_boss_jump_right,12,path_action_stop,0);
		}
	break;
}