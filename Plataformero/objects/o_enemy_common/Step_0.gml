// ========== STEP EVENT ==========
if (hp <= 0)
{
	instance_destroy()
	dead = 1
}
// Aplicar gravedad
y_speed += grav;

// Límite de velocidad de caída
if (y_speed > 10) {
    y_speed = 10;
}

// Comprobar si está en el suelo
if (place_meeting(x, y + 1, o_solid)) {
    ground = true;
    y_speed = 0;
} else {
    ground = false;
}

// ========== LÓGICA DE MOVIMIENTO ==========

var hueco_detectado = false;
var pared_detectada = false;

// Detectar huecos adelante (para saltar)
if (ground) {
    // Chequear si hay suelo adelante
    var check_x = x + (check_distance * direction_facing);
    if (!position_meeting(check_x, y + check_height, o_solid)) {
        hueco_detectado = true;
    }
}

// Detectar paredes adelante (para saltar)
// Revisar varios puntos verticales para mejor detección
var wall_check_x = x + (check_height * direction_facing);
if (place_meeting(wall_check_x, y, o_solid) || 
    place_meeting(wall_check_x, y - 16, o_solid) ||
    place_meeting(wall_check_x, y - 32, o_solid)) {
    pared_detectada = true;
}

// Saltar si detecta hueco o pared
if ((hueco_detectado || pared_detectada) && ground) {
    y_speed = -jump_power;
    ground = false;
}

// Movimiento horizontal
// Prevenir movimiento si hay pared sólida adelante Y está en el suelo
var can_move = true;
var next_x = x + (move_speed * direction_facing);

if (ground && place_meeting(next_x, y, o_solid)) {
    can_move = false;
}

if (can_move) {
    x += move_speed * direction_facing;
}

// ========== MOVIMIENTO VERTICAL ==========
// Aplicar velocidad vertical
if (!place_meeting(x, y + y_speed, o_solid)) {
    y += y_speed;
} else {
    // Ajuste fino cuando toca el suelo/techo
    while (!place_meeting(x, y + sign(y_speed), o_solid)) {
        y += sign(y_speed);
    }
    y_speed = 0;
}

// ========== SISTEMA DE DISPARO ==========
shoot_timer++;

if (shoot_timer >= shoot_cooldown) {
    // Crear disparo
    var shot = instance_create_layer(x, y + shoot_offset_y, "Instances", o_enemy_shot);
    
    // Configurar dirección del disparo hacia la izquierda
    if (instance_exists(shot)) {
        shot.direction = 180; // 180 grados = izquierda
        shot.speed = 5; // Ajusta la velocidad del disparo
    }
    
    // Opcional: reproducir sonido de disparo
    audio_play_sound(snd_enemy_shot_3, 1, false);
    
    // Reiniciar timer
    shoot_timer = 0;
}