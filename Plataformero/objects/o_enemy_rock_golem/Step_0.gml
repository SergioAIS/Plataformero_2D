// Aplicar gravedad
y_speed += grav;
if (y_speed > 10) y_speed = 10;

// Verificar suelo
if (place_meeting(x, y + 1, o_solid) or place_meeting(x, y + 1, o_terrain)) {
    ground = true;
    y_speed = 0;
} else {
    ground = false;
}

// Movimiento vertical
if (!place_meeting(x, y + y_speed, o_solid) and !place_meeting(x, y + y_speed, o_terrain)) {
    y += y_speed;
} else {
    while (!place_meeting(x, y + 1, o_solid) and !place_meeting(x, y + 1, o_terrain)) {
        y += 1;
    }
    y_speed = 0;
}

// Movimiento horizontal (solo si NO está endurecido)
if (!hardened and ground) {
    next_x = x + (xSpeed * facing);
    
    // Detectar paredes
    if (place_meeting(next_x, y, o_solid) or place_meeting(next_x, y, o_terrain)) {
        facing *= -1; // Voltear
    }
    // Detectar huecos
    else if (!place_meeting(next_x, y + check_distance, o_solid) and 
             !place_meeting(next_x, y + check_distance, o_terrain)) {
        facing *= -1; // Voltear
    }
    // Moverse
    else {
        x += xSpeed * facing;
    }
}

// Voltear sprite
image_xscale = facing;

event_inherited();

