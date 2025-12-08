draw_self(); // Dibuja al jefe normalmente

if (active == 1 && state != BOSS_STATE.MUERTE) {
    // Dibujar barra de vida simple
    var bar_w = 100; // Ancho de la barra
    var x1 = x - bar_w / 2;
    var y1 = y - sprite_height - 20;
    var x2 = x1 + (hp / max_hp) * bar_w;
    var y2 = y1 + 10;
    
    draw_set_color(c_red);
    draw_rectangle(x1, y1, x2, y2, false);
    draw_set_color(c_white); // Resetear color
}