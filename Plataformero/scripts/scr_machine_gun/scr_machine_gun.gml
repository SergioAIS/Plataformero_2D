// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_machine_gun(){
	can_shoot = 0;
    alarm[0] = 15; // cadencia más rápida

    if (ammo_machine > 0) {
        ammo_machine -= 1;

        // 1) Vector de apuntado (flechas)
        var ax = keyboard_check(vk_right) - keyboard_check(vk_left);
        var ay = keyboard_check(vk_down)  - keyboard_check(vk_up);

        // 2) Bloquear disparo hacia abajo si está en el suelo
        if (ay > 0 && ground) ay = 0;

        // 3) Si no hay input, usar la mirada actual
        if (ax == 0 && ay == 0) {
            ax = (right) ? 1 : -1;
            ay = 0;
        }

        // 4) Normalizar
        var len = point_distance(0, 0, ax, ay);
        ax /= len; ay /= len;

        // 5) Actualizar "right" si hay componente horizontal
        if (ax != 0) right = (ax > 0);

        // 6) Posición de salida
        var muzzle_off = 16;
        var sx = x + ax * muzzle_off + weapon_modx * sign(ax == 0 ? (right ? 1 : -1) : ax);
        var sy = y + ay * muzzle_off + weapon_mody;

        // 7) Crear bala y darle dirección/velocidad
        var obj = instance_create_layer(sx, sy, "att", o_pistol);
        obj.direction = point_direction(0, 0, ax, ay);
        obj.speed = 12;              // ajusta si quieres más/menos rápido
        obj.image_angle = obj.direction;

        audio_play_sound(snd_shot_1, 1, 0);
    }
}