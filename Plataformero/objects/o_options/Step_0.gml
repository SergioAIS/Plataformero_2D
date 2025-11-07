/// o_options - Step

var up    = keyboard_check_pressed(vk_up);
var down  = keyboard_check_pressed(vk_down);
var left  = keyboard_check_pressed(vk_left);   // pasos discretos
var right = keyboard_check_pressed(vk_right);
var ok    = keyboard_check_pressed(vk_enter);
var back  = keyboard_check_pressed(vk_escape);

// Mover cursor
if (up)   menu_index = (menu_index - 1 + MAX_ITEMS) mod MAX_ITEMS;
if (down) menu_index = (menu_index + 1) mod MAX_ITEMS;

// 0: Master, 1: Music, 2: SFX, 3: Fullscreen
if (menu_index == 0) {
    if (left  && master_lvl > 0)           { master_lvl--; scr_apply_audio_gains(master_lvl, sfx_lvl, bgm_lvl, MAX_LVL); }
    if (right && master_lvl < MAX_LVL)     { master_lvl++; scr_apply_audio_gains(master_lvl, sfx_lvl, bgm_lvl, MAX_LVL); }
}
else if (menu_index == 1) {
    if (left  && bgm_lvl > 0)              { bgm_lvl--;    scr_apply_audio_gains(master_lvl, sfx_lvl, bgm_lvl, MAX_LVL); }
    if (right && bgm_lvl < MAX_LVL)        { bgm_lvl++;    scr_apply_audio_gains(master_lvl, sfx_lvl, bgm_lvl, MAX_LVL); }
}
else if (menu_index == 2) {
    if (left  && sfx_lvl > 0)              { sfx_lvl--;    scr_apply_audio_gains(master_lvl, sfx_lvl, bgm_lvl, MAX_LVL); }
    if (right && sfx_lvl < MAX_LVL)        { sfx_lvl++;    scr_apply_audio_gains(master_lvl, sfx_lvl, bgm_lvl, MAX_LVL); }
}
else if (menu_index == 3) {
    if (left || right || ok) {
        opt_fullscreen = !opt_fullscreen;
        window_set_fullscreen(opt_fullscreen);
    }
}

// Guardar con Enter en “Pantalla completa” o con ESC en cualquier lado
if (back || (menu_index == 3 && ok)) {
    ini_open("settings.ini");
    ini_write_real("audio10","master_lvl", master_lvl);
    ini_write_real("audio10","bgm_lvl",    bgm_lvl);
    ini_write_real("audio10","sfx_lvl",    sfx_lvl);
    ini_write_real("video","fullscreen",   opt_fullscreen);
    ini_close();

    // Si esto es su propia room:
    room_goto_previous(); // o instance_destroy();
}
