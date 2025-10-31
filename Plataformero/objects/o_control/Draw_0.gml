
camera_x = camera_get_view_x(view_camera[0]);
camera_y = camera_get_view_y(view_camera[0]);

//draw_text(camera_x+16,camera_y+16,o_player.hp);

if(obj_player.hp > 0)
{
	draw_sprite_ext(s_life_bar,0,camera_x+54,camera_y+27,obj_player.hp*100/obj_player.hpMax,1,0,c_white,1);
}

draw_sprite(s_HUD,0,camera_x,camera_y);


draw_set_color(c_white);
//draw_set_font(font_hud);

switch(obj_player.weapon)
{
	case "pistol":
		draw_text(camera_x+58,camera_y+70,"000");	
	break;
	
	case "heavy":
		draw_sprite(s_pow_magnum,0,camera_x+20,camera_y+60)
		draw_text(camera_x+58,camera_y+70,obj_player.ammo_heavy);	
	break;
	
	case "laser":
		draw_sprite(s_pow_laser,0,camera_x+20,camera_y+60)
		draw_text(camera_x+58,camera_y+70,obj_player.ammo_laser);	
	break;
}

