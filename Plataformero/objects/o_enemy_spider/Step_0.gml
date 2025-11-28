// Sistema de estados
switch(state) {
    case "waiting":
        // Esperar al jugador debajo
        if (instance_exists(obj_player)) {
            player_below = (obj_player.y > y) and (abs(obj_player.x - x) < detect_range_x);
            
            if (player_below) {
                state = "descending";
            }
        }
    break;
    
    case "descending":
        // Bajar rápidamente
        y += descent_speed;
        
        // Verificar si tocó el suelo o llegó al máximo
        if (place_meeting(x, y + 1, o_solid) or 
            place_meeting(x, y + 1, o_terrain) or
            y >= start_y + max_descent) {
            state = "ground";
            alarm[0] = ground_wait_time; // Timer para subir
        }
    break;
    
    case "ground":
        // Esperar en el suelo (el alarm[0] cambiará el estado)
        // No hacer nada
    break;
    
    case "ascending":
        // Subir lentamente
        y -= ascent_speed;
        
        // Verificar si llegó a la posición inicial
        if (y <= start_y) {
            y = start_y;
            state = "waiting";
        }
    break;
}

// Hacer daño al jugador si lo toca mientras baja
if (state == "descending" and place_meeting(x, y, obj_player)) {
    // Aplicar daño al jugador
    // o_player.hp -= 10;
    // o_player.invi = 1;
    // o_player.alarm[1] = 60; // Invulnerabilidad
}


event_inherited();

