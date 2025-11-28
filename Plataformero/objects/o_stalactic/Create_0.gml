// Estados: "waiting", "shaking", "falling", "stuck"
state = "waiting";

// Detección
detect_range = 30; // Rango horizontal para detectar jugador
detect_below_distance = 400; // Distancia vertical máxima

// Temblor
shake_time = 20; // Frames que tiembla antes de caer
shake_intensity = 3;
shake_timer = 0;

// Caída
y_speed = 0;
grav = 0.8;
max_fall_speed = 12;

// Daño
dmg = 25;