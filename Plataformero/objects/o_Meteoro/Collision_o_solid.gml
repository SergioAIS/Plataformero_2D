// Si toca al jugador, le hace daño (mismo código que arriba)
if (place_meeting(x, y, obj_player)) {
    with (obj_player) {
        if (!invencible) {
            hp -= 15;
            invencible = true;
            alarm[0] = 60;
        }
    }
}

// Crear efecto de explosión (opcional, si tienes el objeto)
// instance_create_layer(x, y, "Instances", obj_Explosion);

instance_destroy(); // Se destruye al tocar suelo o jugador