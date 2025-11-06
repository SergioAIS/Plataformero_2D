//// o_tracer_player -> Begin Step
//if (_processed) exit;

//var dir;

//// Usa h/vspeed si existen; si no, usa direction
//if (hspeed != 0 || vspeed != 0) {
//    dir = point_direction(0, 0, hspeed, vspeed);
//} else {
//    dir = direction;
//}

//var ox = x, oy = y;
//var t = 0;
//var hit = false;

//repeat (range div step) {
//    var px = ox + lengthdir_x(t, dir);
//    var py = oy + lengthdir_y(t, dir);

//    if (place_meeting(px, py, o_enemy_body) || place_meeting(px, py, o_solid)) {
//        hit = true;
//        break;
//    }
//    t += step;
//}

//// Posicionar el tracer al final del recorrido
//if (!hit) {
//    x = ox + lengthdir_x(range, dir);
//    y = oy + lengthdir_y(range, dir);
//} else {
//    var backoff = 16;               // evita que “entre” en el collider
//    t = max(0, t - backoff);
//    x = ox + lengthdir_x(t, dir);
//    y = oy + lengthdir_y(t, dir);
//}

//// Partículas en la punta
//part_particles_create(global.part_front, x, y, global.p_spark_laser, 9);

//_processed = true;
