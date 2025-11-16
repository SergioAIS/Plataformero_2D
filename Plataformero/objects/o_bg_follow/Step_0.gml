/// Step – o_bg_follow

if (!instance_exists(target)) exit;

var bw = sprite_get_width(spr_bg);

// límites internos (como el Horizontal Border del viewport)
var left_limit  = bg_x + border_x;
var right_limit = bg_x + bw - border_x;

// mover el fondo solo cuando el jugador se sale del “marco”
if (target.x < left_limit) {
    var shift = left_limit - target.x;
    bg_x -= shift;
}
else if (target.x > right_limit) {
    var shift = target.x - right_limit;
    bg_x += shift;
}

// clamp para no salirnos de la room
bg_x = clamp(bg_x, 0, room_width - bw);

// NO tocamos bg_y nunca: se queda en 0
