//Sprite checks
if (ground)
{
	if (xSpeed == 0)
	{
		sprite_index = s_stand	
	}
	else
	{
		sprite_index = s_walk
	}
}
else
{
	if (ySpeed < 0)
	{
		sprite_index = s_jump
	}
	else
	{
		sprite_index = s_fall
	}
}

if (right)
{
	image_xscale = 1	
}
else
{
	image_xscale = -1
}

mask_index = s_player_mask
draw_self()