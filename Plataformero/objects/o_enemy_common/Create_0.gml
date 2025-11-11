// ========== CREATE EVENT ==========
// Movimiento
move_speed = 2;
direction_facing = -1; // -1 = izquierda, 1 = derecha

hp = 10
dead = 0
dmg = 1
// Física
y_speed = 0;
grav = 0.5;
jump_power = 8;
ground = false;

// Detección de obstáculos
check_distance = 32; // Distancia para detectar huecos/obstáculos
check_height = 16; // Altura para detectar paredes

// Sistema de disparo
shoot_timer = 0;
shoot_cooldown = 150; // Dispara cada 90 frames (~1.5 segundos a 60fps)
shoot_offset_y = -30; // Offset vertical del disparo