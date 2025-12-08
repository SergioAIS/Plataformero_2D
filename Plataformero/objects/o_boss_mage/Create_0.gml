/// @description Inicialización de variables

// 1. Estados (Máquina de Estados)
enum BOSS_STATE {
    IDLE,           // Flotando y esperando
    ATK_LASER,      // Rayo vertical desde el cielo
    ATK_METEOROS,   // Rocas cayendo aleatoriamente
    ATK_ORBES,      // NUEVO: Anillos de proyectiles
    MUERTE          // Animación de derrota
}

state = BOSS_STATE.IDLE;

// 2. Variables de Combate
hp = 100;
max_hp = 100;
active = 0; // El jefe no hará NADA hasta que esto sea 1

// 3. Timers y Contadores
timer_ataque = 0;       // Para controlar la duración de los ataques
timer_entre_ataques = 120; // Tiempo de espera entre ataques (60 frames = 1 seg)
fase_ataque = 0;        // Sub-variable para controlar pasos dentro de un ataque

// 4. Movimiento (Flotación)
y_start = y;            // Guarda la posición Y inicial
float_speed = 0.05;     // Velocidad de la oscilación
float_range = 10;       // Rango de píxeles que sube y baja
float_angle = 0;