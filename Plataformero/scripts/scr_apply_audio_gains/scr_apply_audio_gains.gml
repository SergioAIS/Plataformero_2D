// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_apply_audio_gains(_master_lvl, _sfx_lvl, _bgm_lvl, _max) {
    var m = scr_to_gain(_master_lvl, _max);
    var s = scr_to_gain(_sfx_lvl,   _max);
    var b = scr_to_gain(_bgm_lvl,   _max);

    // Master afecta a todo el mix
    audio_master_gain(m); // LTS: 1 solo argumento

    // Grupos (si las constantes existen)
    audio_group_set_gain(effects, s, 0);
    audio_group_set_gain(music,   b, 0);
}