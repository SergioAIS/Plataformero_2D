/// Create – o_bg_follow

spr_bg = Background_0;   // tu sprite de fondo
target = obj_player;    // tu jugador

// HORIZONTAL BORDER EXACTO:
border_x = 300;

// ya NO vamos a seguir en Y
follow_y = false;

// tamaño del fondo (por si lo necesitas luego)
var bw = sprite_get_width(spr_bg);
// var bh = sprite_get_height(spr_bg);

// posición inicial del fondo:
// en X lo centramos en el jugador (pero esto es opcional)
// en Y lo fijamos ARRIBA (0)
if (instance_exists(target)) {
    bg_x = target.x - bw / 2;
} else {
    bg_x = 0;
}

// que no se salga de la room en X
bg_x = clamp(bg_x, 0, room_width - bw);

// Y fijo arriba
bg_y = 0;
