if (!death)
{
	//Sprite checks
	if (ground)
	{
		if (xSpeed == 0)
		{
			if (crouch)
			{
				sprite_index = s_crouch
			}
			else
			{
				sprite_index = s_stand	
			}
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

	if (!crouch) mask_index = s_player_mask else mask_index = s_player_mask_crouch

	if (invi) image_alpha = 0.75 else image_alpha = 1
}
else
{
	sprite_index = s_death
}
draw_self()