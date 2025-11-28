draw_self();

// Debug visual

if (state == "waiting") {
    draw_set_color(c_red);
    draw_set_alpha(0.3);
    draw_rectangle(x - detect_range, y, x + detect_range, y + detect_below_distance, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

