
if(obj_player.right)
{
		if(!collision_line(x,y,x+300,y,o_enemy_body,0,1))
		{
			move_contact_solid(0,300);
		}
		else
		{
			x_speed_temp = 0;
			while(x_speed_temp < 300 and !place_meeting(x+x_speed_temp,y,o_enemy_body) and !place_meeting(x+x_speed_temp,y,o_solid))
			{
				x_speed_temp += 4;
			}
			x += x_speed_temp + 16;
		}
}else
{
		if(!collision_line(x,y,x-300,y,o_enemy_body,0,1))
		{
			move_contact_solid(180,300);
		}
		else
		{
			x_speed_temp = 0;
			while(x_speed_temp < 300 and !place_meeting(x-x_speed_temp,y,o_enemy_body) and !place_meeting(x-x_speed_temp,y,o_solid))
			{
				x_speed_temp += 4;
			}
			x -= x_speed_temp + 16;
		}
}

part_particles_create(global.part_front,x+hspeed,y,global.p_spark_laser,9);
alarm[0] = 2 * room_speed;
