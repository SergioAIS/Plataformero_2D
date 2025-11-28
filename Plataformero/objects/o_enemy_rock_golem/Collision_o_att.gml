if (!hardened) {
    hardened = true;
    alarm[0] = hardened_duration;
    
    // Efecto visual/sonido
    image_blend = hardened_color;
}

event_inherited();

