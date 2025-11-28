draw_self();

// Indicador visual cuando está endurecido
if (hardened) {
    draw_set_alpha(0.3);
    draw_set_color(c_gray);
    draw_circle(x, y, 30, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}