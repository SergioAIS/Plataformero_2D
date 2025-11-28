draw_self();

// Dibujar la "telaraña" (línea desde posición inicial)
if (state != "waiting") {
    draw_set_color(c_white);
    draw_line_width(x, start_y, x, y, 2);
    draw_set_color(c_white);
}