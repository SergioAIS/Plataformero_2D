// HP
hp = 15;
hpMax = 15;

// Posición inicial (techo)
start_y = y;
max_descent = 150; // Máximo que puede bajar

// Estados: "waiting", "descending", "ground", "ascending"
state = "waiting";

// Movimiento
descent_speed = 3;
ascent_speed = 1;
ground_wait_time = 60; // Frames que espera en el suelo

// Detección
detect_range_x = 40; // Rango horizontal para detectar jugador
detect_below = true; // Solo detecta si el jugador está debajo

dmg = 10