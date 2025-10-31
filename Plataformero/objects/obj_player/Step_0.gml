
if(!dead)
{

// INPUT ---------------------------------------------------

//Weapon Change ----------------------

if(keyboard_check_pressed(ord("1"))) weapon = "pistol";
if(keyboard_check_pressed(ord("2")) and pick_heavy) weapon = "heavy";
if(keyboard_check_pressed(ord("3")) and pick_laser) weapon = "laser";

//Movement LEFT RIGHT ----------------

if(keyboard_check(vk_right))
{
	if(x_speed < 0) x_speed = 0;
	if(x_speed < x_speed_max) x_speed += x_accel;
	right = 1;
}

if(keyboard_check(vk_left))
{
	if(x_speed > 0) x_speed = 0;
	if(x_speed > -x_speed_max) x_speed -= x_accel;
	right = 0;
}

if(!keyboard_check(vk_right) and !keyboard_check(vk_left)) x_speed = 0;
if(keyboard_check(vk_right) and keyboard_check(vk_left)) x_speed = 0;

// Crouch ---------------

if(keyboard_check(vk_down))
{
	if(ground)
	{
		crouch = 1;
		x_speed = 0;
		weapon_mody = -14;
	}
}
else
{
	crouch = 0;
	weapon_mody = -25;
}

// Jump -----------------

if(keyboard_check_pressed(vk_alt))
{
	if(ground or coyote_c or dj)
	{
		if(!ground and dj){
			dj=0
			part_particles_create(global.part_back,x+hspeed,y-20,global.p_dj,18);
			part_particles_create(global.part_back,x+hspeed,y-20,global.p_dj2,6);
			y_speed = -jump_power+2;
		}
		else
		{
			ground = 0;
			coyote_c = 0;
		
			if(crouch)
			{
				if(place_free(x,y+1))
				{
					y += 1;
				}
				else
				{
					y_speed = -jump_power;
				}
			}
			else
			{
				y_speed = -jump_power;
			}
		}
	}
}

if(keyboard_check_released(vk_alt))
{
	if(y_speed < 0) y_speed = 0;
}

// MOVIMEINTO ----------------------------------------------

if(x_speed != 0)
{
	if(x_speed > 0)
	{
		move_contact_solid(0,x_speed);
	}
	else
	{
		move_contact_solid(180,abs(x_speed));	
	}
}

if(y_speed != 0)
{
	if(y_speed > 0)
	{
		if(collision_rectangle(x-12,y-10,x+12,y,o_terrain,0,1))
		{
			move_contact_solid(270,y_speed);
		}
		else
		{
			y_speed_temp = round(y_speed);
			while(collision_rectangle(x-12,y,x+12,y+y_speed_temp,o_terrain,0,1) != noone and y_speed_temp != 0)
			{
				y_speed_temp -= 1;
			}
			y += y_speed_temp;
		}
	}
	else
	{
		move_contact_solid(90,abs(y_speed));	
	}
}

// CHECKS -------------------------------------------------

if(hp <= 0)
{
	dead = 1;
	invi = 1;
	alarm[1] = -1;
}

if(y_speed >= 0 and  collision_rectangle(x-12,y,x+12,y+1,o_terrain,0,1) and collision_rectangle(x-12,y-10,x+12,y,o_terrain,0,1)==noone )
{
	ground = 1;
	y_speed = 0;
	coyote_c = 1;
	if(pick_dj)dj = 1;
}
else
{
	ground = 0;
	y_speed += grav;
	if(coyote_c and alarm[11] == -1) alarm[11] = coyote_t;
	
	if(y_speed > fall_max) y_speed = fall_max;
	
	if( !place_free(x,y-1) )
	{
		if(y_speed < 0) y_speed = 0;
	}
}

// Weapons ------------------------------------------------

if(keyboard_check(vk_control))
{
	if(can_shoot)
	{
		switch(weapon)
		{
			case "pistol":
				scr_pistol();
			break;
			
			case "heavy":
				scr_heavy();
			break;
			
			case "laser":
				scr_laser();
			break;
		}
	}
}

}
else
{
	image_alpha -= 0.005;
	if(image_alpha <= 0)
	{
		// RESPAWN -------------------
		global.player_respawn = 1;
		hp = hpMax;
		dead = 0;
		invi = 0;
		room_goto(global.checkpoint);
	}
}
