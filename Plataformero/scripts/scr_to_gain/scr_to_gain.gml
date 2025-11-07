// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_to_gain(_lvl, _max) {
    var g = _lvl / _max;   // lineal
    // g = power(g, 2.2);  // descomenta si prefieres curva perceptual
    return clamp(g, 0, 1);
}