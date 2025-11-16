// Aplicar gravedad
if (!ground) {
    y_speed += grav;
    if (y_speed > max_fall_speed) {
        y_speed = max_fall_speed;
    }
}

// Aplicar fricción
if (ground) {
    x_speed *= friction_ground;
    if (abs(x_speed) < 0.1) {
        x_speed = 0;
    }
} else {
    x_speed *= friction_air;
}

// ========== MOVIMIENTO HORIZONTAL ==========
if (x_speed != 0) {
    var move_amount = abs(x_speed);
    var move_dir = sign(x_speed);
    
    // Colisión con sólidos (o_solid y o_terrain)
    if (place_meeting(x + x_speed, y, o_solid) || place_meeting(x + x_speed, y, o_terrain)) {
        while (!place_meeting(x + move_dir, y, o_solid) && !place_meeting(x + move_dir, y, o_terrain)) {
            x += move_dir;
        }
        x_speed = 0;
    } 
    // Colisión con otros interactables
    else if (place_meeting(x + x_speed, y, o_interactable)) {
        var other_obj = instance_place(x + x_speed, y, o_interactable);
        
        if (other_obj != noone && other_obj.id != id) {
            while (!place_meeting(x + move_dir, y, o_interactable)) {
                x += move_dir;
            }
            
            // Transferir momento
            if (variable_instance_exists(other_obj, "x_speed")) {
                other_obj.x_speed = x_speed * 0.7;
            }
            x_speed *= 0.3;
        }
    } 
    else {
        x += x_speed;
    }
}

// ========== MOVIMIENTO VERTICAL ==========
ground = false;

// Verificar suelo con terrain, solid e interactables
if (place_meeting(x, y + 1, o_terrain) || 
    place_meeting(x, y + 1, o_solid)) {
    ground = true;
}
else if (place_meeting(x, y + 1, o_interactable)) {
    var obj_below = instance_place(x, y + 1, o_interactable);
    if (obj_below != noone && obj_below.id != id) {
        ground = true;
    }
}

// Aplicar movimiento vertical
if (y_speed != 0) {
    var move_dir = sign(y_speed);
    
    // Colisión hacia abajo con terrain/solid
    if (y_speed > 0 && (place_meeting(x, y + y_speed, o_terrain) || place_meeting(x, y + y_speed, o_solid))) {
        while (!place_meeting(x, y + move_dir, o_terrain) && !place_meeting(x, y + move_dir, o_solid)) {
            y += move_dir;
        }
        y_speed = 0;
        ground = true;
    }
    // Colisión hacia abajo con otros interactables
    else if (y_speed > 0 && place_meeting(x, y + y_speed, o_interactable)) {
        var other_obj = instance_place(x, y + y_speed, o_interactable);
        
        if (other_obj != noone && other_obj.id != id) {
            while (!place_meeting(x, y + move_dir, o_interactable)) {
                y += move_dir;
            }
            y_speed = 0;
            ground = true;
        }
    }
    // Colisión con techo
    else if (y_speed < 0 && (place_meeting(x, y + y_speed, o_terrain) || place_meeting(x, y + y_speed, o_solid))) {
        while (!place_meeting(x, y + move_dir, o_terrain) && !place_meeting(x, y + move_dir, o_solid)) {
            y += move_dir;
        }
        y_speed = 0;
    }
    // Movimiento libre
    else {
        y += y_speed;
    }
}

// Detectar colisión con jugador (empuje)
if (instance_exists(obj_player)) {
    var player = instance_nearest(x, y, obj_player);
    
    if (place_meeting(x, y, player)) {
        var push_dir = sign(x - player.x);
        
        if ((push_dir > 0 && player.x_speed > 0) || (push_dir < 0 && player.x_speed < 0)) {
            x_speed = player.x_speed * 0.6;
        }
        
        var overlap = 0;
        while (place_meeting(x, y, player) && overlap < 10) {
            x += push_dir * 0.5;
            overlap++;
        }
    }
}

// Destrucción
if (hp <= 0) {
    instance_destroy();
}