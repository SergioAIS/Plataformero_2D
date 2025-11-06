// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_laser() {
    can_shoot = 0;
    alarm[0] = 20; // cooldown

    if (ammo_laser > 0) {
        ammo_laser -= 1;

        // 1) Vector de apuntado con flechas
        var ax = keyboard_check(vk_right) - keyboard_check(vk_left);
        var ay = keyboard_check(vk_down)  - keyboard_check(vk_up);

        // 2) Bloquear ↓ si estás en el suelo
        if (ay > 0 && ground) ay = 0;

        // 3) Si no hay input, usar la mirada actual
        if (ax == 0 && ay == 0) {
            ax = right ? 1 : -1;
            ay = 0;
        }

        // 4) Normalizar
        var len = point_distance(0, 0, ax, ay);
        ax /= len; ay /= len;

        // 5) Actualizar facing
        if (ax != 0) right = (ax > 0);

        // 6) Punto de salida del láser
        var muzzle_off = 16;
        var sx = x + ax * muzzle_off + weapon_modx * sign(ax == 0 ? (right ? 1 : -1) : ax);
        var sy = y + ay * muzzle_off + weapon_mody;

        // 7) Dirección y raycast manual hasta colisión
        var dir   = point_direction(0, 0, ax, ay);
        var range = 300;
        var step  = 2; // más fino

        var t = 0;
        var hit = false;
        var hit_enemy = false;

        repeat (range div step) {
            var px = sx + lengthdir_x(t, dir);
            var py = sy + lengthdir_y(t, dir);

            if (place_meeting(px, py, o_enemy_body) || place_meeting(px, py, o_solid)) {
                hit = true;
                hit_enemy = place_meeting(px, py, o_enemy_body);
                break;
            }
            t += step;
        }

        // 8) Ajuste final: empujar dentro del enemigo / retroceder en sólido
        if (hit) {
            if (hit_enemy) {
                t = min(range, t + 16); // como tu +16 original al golpear enemigo
            } else {
                t = max(0, t - 2);      // pequeño backoff en pared
            }
        }

        // 9) Punto final
        var hx = sx + lengthdir_x(t, dir);
        var hy = sy + lengthdir_y(t, dir);

        // 10) Tracer en el impacto (solo efectos/partículas)
        var tracer = instance_create_layer(hx, hy, "att", o_tracer_player);

        // 11) Rayo orientado y escalado
        var obj = instance_create_layer(sx, sy, "att", o_laser_player);
        obj.image_angle  = dir;
        obj.image_xscale = point_distance(sx, sy, hx, hy);

        audio_play_sound(snd_shot_1, 1, 0);
    }
}

