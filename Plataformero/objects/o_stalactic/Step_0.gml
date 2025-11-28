switch(state) {
    case "waiting":
        // Detectar jugador debajo
        if (instance_exists(obj_player)) {
            player_below = (obj_player.y > y) and 
                          (obj_player.y < y + detect_below_distance) and
                          (abs(obj_player.x - x) < detect_range);
            
            if (player_below) {
                state = "shaking";
                shake_timer = shake_time;
            }
        }
    break;
    
    case "shaking":
        // Animación de temblor
        shake_timer--;
        image_angle = random_range(-shake_intensity, shake_intensity);
        
        if (shake_timer <= 0) {
            state = "falling";
            image_angle = 0;
        }
    break;
    
    case "falling":
        // Aplicar gravedad
        y_speed += grav;
        if (y_speed > max_fall_speed) y_speed = max_fall_speed;
        
        // Caer
        y += y_speed;
        
        // Detectar colisión con suelo
        if (place_meeting(x, y + 1, o_solid) or place_meeting(x, y + 1, o_terrain)) {
            // Ajustar posición
            while (!place_meeting(x, y + 1, o_solid) and !place_meeting(x, y + 1, o_terrain)) {
                y += 1;
            }
            
            state = "stuck";
            y_speed = 0;
            
            // Convertirse en sólido temporal (opcional)
            // object_set_solid(id, true);
            
            // Efecto de impacto
            // part_particles_create(global.part_back, x, y, global.p_rock_impact, 15);
            // screen_shake(5, 10); // Si tienes sistema de screen shake
            
            // Destruirse después de X segundos (opcional)
            alarm[0] = 300; // 5 segundos
        }
        
        // Dañar al jugador si lo toca mientras cae
        if (place_meeting(x, y, obj_player)) {
            // o_player.hp -= damage;
            // o_player.invi = 1;
            // o_player.alarm[1] = 60;
        }
    break;
    
    case "stuck":
        // No hacer nada, está clavada en el suelo
        // Se puede usar como plataforma temporal
    break;
}