/// o_options - Create

// Navegación
menu_index = 0;      // 0..3 (4 opciones)
MAX_ITEMS  = 4;

// Volúmenes discretos 0..10
MAX_LVL   = 10;
master_lvl = 8;      // Volumen (Master)
bgm_lvl    = 7;      // Music Volume  -> "music"
sfx_lvl    = 9;      // SFX Volume    -> "effects"

// Pantalla completa
opt_fullscreen = window_get_fullscreen();

// Cargar INI (si existe)
ini_open("settings.ini");
if (ini_key_exists("audio10","master_lvl")) master_lvl = ini_read_real("audio10","master_lvl", master_lvl);
if (ini_key_exists("audio10","bgm_lvl"))    bgm_lvl    = ini_read_real("audio10","bgm_lvl",    bgm_lvl);
if (ini_key_exists("audio10","sfx_lvl"))    sfx_lvl    = ini_read_real("audio10","sfx_lvl",    sfx_lvl);
if (ini_key_exists("video","fullscreen"))   opt_fullscreen = ini_read_real("video","fullscreen", opt_fullscreen);
ini_close();

// Aplicar estado inicial
window_set_fullscreen(opt_fullscreen);
scr_apply_audio_gains(master_lvl, sfx_lvl, bgm_lvl, MAX_LVL);
