image_angle += rotacion; // Efecto visual de giro mientras cae

// Si por error cae fuera del mapa y no toca suelo
if (y > room_height) instance_destroy();