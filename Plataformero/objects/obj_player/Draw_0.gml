
if(!dead)
{

//Sprite Checks ---------------------------------------------

if(ground)
{
	if(x_speed == 0)
	{
		if(!crouch)
		{
			sprite_index = s_stand;
		}
		else
		{
			sprite_index = s_crouch;
		}
	}
	else
	{
		sprite_index = s_walk;
	}
}else
{
	if(y_speed >= 0)
	{
		sprite_index = s_fall;
	}
	else
	{
		sprite_index = s_jump;
	}
}

if(right)
{
	image_xscale = 1;
}
else
{
	image_xscale = -1;
}

if(invi)
{
	image_alpha = 0.75;
}
else
{
	image_alpha = 1;
}

if(!crouch) mask_index = s_player_mask; else mask_index = s_player_mask_crouch;

}
else
{
	sprite_index = s_death;
}

draw_self();
