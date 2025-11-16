// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_melee_attack(){
	// Buscar todos los enemigos Y cajas en rango
	targets = ds_list_create();
	num_enemies = collision_circle_list(x, y, melee_range, o_enemy_body, false, true, targets, false);
	
	if (num_enemies > 0) {
	    for (i = 0; i < num_enemies; i++) {
	        target = targets[| i];
        
	        // Verificar que el target esté en la dirección correcta
	        target_direction = sign(target.x - x);
	        player_direction = (right == 1) ? 1 : -1;
        
	        // Solo golpear targets que estén delante del jugador
	        if (target_direction == player_direction or target_direction == 0) {
	            // Aplicar daño
	            if (variable_instance_exists(target, "hp")) {
	                target.hp -= melee_damage;
	            }
            
	            // Aplicar knockback - priorizar x_speed personalizada
	            if (variable_instance_exists(target, "x_speed")) {
	                // Usa x_speed personalizada (cajas, algunos enemigos)
	                target.x_speed = player_direction * melee_knockback;
	            } else {
	                // Usa hspeed built-in (o_enemy_walker)
	                // SOBRESCRIBIR completamente, no sumar
	                target.hspeed = player_direction * melee_knockback;
	            }
            
	            // Knockback vertical si es una caja
	            if (object_get_parent(target.object_index) == o_box or target.object_index == o_box) {
	                if (variable_instance_exists(target, "y_speed")) {
	                    target.y_speed = -3;
	                }
	            }
            
	            // Efecto visual
	            part_particles_create(global.part_back, target.x, target.y - 20, global.p_dj, 12);
	        }
	    }
    
	    // Activar cooldown
	    melee_cooldown = melee_cooldown_max;
	}
	
	ds_list_destroy(targets);
}