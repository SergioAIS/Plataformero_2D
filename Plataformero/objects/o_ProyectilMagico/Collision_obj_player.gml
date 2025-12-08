// Lógica simple de daño
with (other) {
    // Asumiendo que tienes una variable de invencibilidad
    if (invencible == false) {
        hp -= 10; // Cantidad de daño
        invencible = true;
        alarm[0] = 60; // Tiempo de invencibilidad (1 seg)
        // Aquí podrías poner un sonido de golpe
    }
}
instance_destroy(); // La bala desaparece al impactar