//Globales
global.previous_room = 0
global.checkpoint = 0
global.player_respawn = 0

//Particles

global.p_pistol = part_type_create();
part_type_shape(global.p_pistol,pt_shape_square);
part_type_size(global.p_pistol,0.04,0.08,0,0);
part_type_color3(global.p_pistol,1900543,7983359,9983);
part_type_alpha3(global.p_pistol,1,1,0);
part_type_speed(global.p_pistol,0.75,1.50,-0.06,0);
part_type_direction(global.p_pistol,0,359,0,0);
part_type_blend(global.p_pistol,1);
part_type_life(global.p_pistol,15,30);


global.p_enemy_shot = part_type_create();
part_type_shape(global.p_enemy_shot,pt_shape_line);
part_type_size(global.p_enemy_shot,0.05,0.08,0,0);
part_type_color3(global.p_enemy_shot,1849599,179,16777215);
part_type_alpha3(global.p_enemy_shot,1,1,0);
part_type_speed(global.p_enemy_shot,0.90,1.50,-0.06,0.40);
part_type_direction(global.p_enemy_shot,0,359,0,0);
part_type_orientation(global.p_enemy_shot,0,0,0,0,1);
part_type_blend(global.p_enemy_shot,1);
part_type_life(global.p_enemy_shot,15,30);
