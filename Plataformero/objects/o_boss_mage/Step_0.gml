/// @description Lógica Principal

// --- REGLA 1: SI NO ESTÁ ACTIVO, NO HACER NADA ---
if (active == 0) {
    // Puedes forzar una animación de "dormido" o "estatua" aquí si quieres
    image_speed = 0; 
    exit; // Detiene la ejecución del código aquí
}

// Reactivar animación si estaba apagada
image_speed = 1; 

// --- EFECTO VISUAL: FLOTAR (Siempre ocurre si está activo) ---
// Solo si está en IDLE o lanzando hechizos, para que no se vea raro
if (state != BOSS_STATE.MUERTE) {
    float_angle += float_speed;
    y = y_start + sin(float_angle) * float_range;
}

// --- MÁQUINA DE ESTADOS ---
switch (state) {
    
    // CASO 1: ESPERANDO (IDLE)
    case BOSS_STATE.IDLE:
        // El jefe mira al jugador
        if (instance_exists(obj_player)) {
            if (obj_player.x < x) image_xscale = -1; else image_xscale = 1;
        }
        
        // Cuenta atrás para atacar
        if (timer_entre_ataques > 0) {
            timer_entre_ataques--;
        } else {
            // Elegir un ataque al azar
            var _ataque = irandom_range(1, 3); 
            
            // Reiniciar variables para el ataque
            timer_ataque = 0; 
            fase_ataque = 0;
            
            // Cambiar estado
            if (_ataque == 1) state = BOSS_STATE.ATK_LASER;
            if (_ataque == 2) state = BOSS_STATE.ATK_METEOROS;
            if (_ataque == 3) state = BOSS_STATE.ATK_ORBES;
        }
        break;

    // CASO 2: RAYO ORBITAL (Persigue al jugador)
    case BOSS_STATE.ATK_LASER:
        timer_ataque++;
        
        // Fase de advertencia (0 a 60 frames)
        if (timer_ataque < 60) {
            // Aquí podrías crear un objeto "warning_line" sobre el jugador
            // O cambiar el sprite del jefe a "casteando"
        }
        // Fase de disparo (Frame 60)
        else if (timer_ataque == 60) {
            // Crea el objeto rayo. Asegúrate de tener un obj_Rayo
            // El rayo debe crearse arriba de la pantalla (y = 0)
            if (instance_exists(obj_player)) {
                instance_create_layer(obj_player.x, 0, "Instances", obj_Rayo);
            }
        }
        // Terminar ataque
        else if (timer_ataque > 100) {
            timer_entre_ataques = 120; // Resetear tiempo de espera
            state = BOSS_STATE.IDLE;   // Volver a IDLE
        }
        break;

    // CASO 3: LLUVIA DE METEOROS
    case BOSS_STATE.ATK_METEOROS:
        timer_ataque++;
        
        // Cada 15 frames lanza un meteoro (durante 3 segundos)
        if (timer_ataque % 15 == 0 && timer_ataque < 180) {
            // Elegir posición X aleatoria dentro de la room
            var _random_x = irandom_range(50, room_width - 50);
            // Crear meteoro arriba
            instance_create_layer(_random_x, -50, "Instances", obj_Meteoro);
        }
        
        // Fin del ataque
        if (timer_ataque > 200) {
            timer_entre_ataques = 100;
            state = BOSS_STATE.IDLE;
        }
        break;

    // CASO 4: ORBES EXPANSIVOS (Nueva Habilidad)
    case BOSS_STATE.ATK_ORBES:
        timer_ataque++;
        
        // Disparar una ráfaga en el frame 30, 60 y 90
        if (timer_ataque == 30 || timer_ataque == 60 || timer_ataque == 90) {
            var _cantidad_balas = 8;
            var _angulo_sep = 360 / _cantidad_balas;
            
            // Bucle para crear balas en círculo
            for (var i = 0; i < _cantidad_balas; i++) {
                var _bala = instance_create_layer(x, y, "Instances", obj_ProyectilMagico);
                _bala.speed = 4; // Velocidad del proyectil
                
                // Calculamos el ángulo: i * separación + un pequeño offset para que giren
                _bala.direction = (i * _angulo_sep) + (timer_ataque/2); 
                _bala.image_angle = _bala.direction;
            }
        }
        
        if (timer_ataque > 120) {
            timer_entre_ataques = 120;
            state = BOSS_STATE.IDLE;
        }
        break;

    // CASO 5: MUERTE
    case BOSS_STATE.MUERTE:
        // Lógica de explosiones, detener música, abrir puerta, etc.
        image_alpha -= 0.01;
        if (image_alpha <= 0) instance_destroy();
        break;
}

// --- CHEQUEO DE VIDA ---
if (hp <= 0 && state != BOSS_STATE.MUERTE) {
    state = BOSS_STATE.MUERTE;
    active = 0; // Opcional: para detener lógica extra
}