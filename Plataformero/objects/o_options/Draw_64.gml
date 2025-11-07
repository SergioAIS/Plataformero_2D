/// o_options - Draw GUI

var x0 = 80;
var y0 = 80;
var lh = 28;

draw_set_color(c_white);
draw_text(x0, y0 - 40, "Opciones");

var labels = [
    "Volumen",        // Master
    "Music Volume",   // audio group: music
    "SFX Volume",     // audio group: effects
    "Pantalla completa"
];

for (var i=0; i<MAX_ITEMS; i++) {
    var yy = y0 + i*lh;
    draw_set_color(i == menu_index ? c_yellow : c_white);
    draw_text(x0, yy, labels[i]);

    if (i == 0) {
        scr_draw_slider10(x0 + 320, yy-4, master_lvl, i==menu_index);
        draw_text(x0 + 320 + 10*(14+4) + 8, yy, string(master_lvl) + "/10");
    } else if (i == 1) {
        scr_draw_slider10(x0 + 320, yy-4, bgm_lvl, i==menu_index);
        draw_text(x0 + 320 + 10*(14+4) + 8, yy, string(bgm_lvl) + "/10");
    } else if (i == 2) {
        scr_draw_slider10(x0 + 320, yy-4, sfx_lvl, i==menu_index);
        draw_text(x0 + 320 + 10*(14+4) + 8, yy, string(sfx_lvl) + "/10");
    } else if (i == 3) {
        draw_text(x0 + 320, yy, window_get_fullscreen() ? "ON" : "OFF");
    }
}
