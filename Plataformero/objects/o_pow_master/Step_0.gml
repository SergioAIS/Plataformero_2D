// Aplicar gravedad
y_speed += grav;

// Limitar velocidad de caída
if (y_speed > 10) y_speed = 10;

// Movimiento vertical
if (!place_meeting(x, y + y_speed, o_solid) and !place_meeting(x, y + y_speed, o_terrain) and !place_meeting(x, y, o_interactable)) {
    y += y_speed;
} else {
    while (!place_meeting(x, y + 1, o_solid) and !place_meeting(x, y + 1, o_terrain) and !place_meeting(x, y + 1, o_interactable)) {
        y += 1;
    }
    y_speed = 0;
}