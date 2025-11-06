// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_heavy() {
    can_shoot = 0;
    alarm[0] = 35; // cooldown

    if (ammo_heavy > 0) {
        ammo_heavy -= 1;

        // 1) Vector de apuntado (flechas). Si quieres sumar WASD, ver nota abajo.
        var ax = keyboard_check(vk_right) - keyboard_check(vk_left);
        var ay = keyboard_check(vk_down)  - keyboard_check(vk_up);

        // 2) Bloquear ↓ si estás en el suelo
        if (ay > 0 && ground) ay = 0;

        // 3) Si no hay input de apuntado, usar la mirada actual
        if (ax == 0 && ay == 0) {
            ax = (right) ? 1 : -1;
            ay = 0;
        }

        // 4) Normalizar para que la diagonal no sea más rápida
        var len = point_distance(0, 0, ax, ay);
        ax /= len; ay /= len;

        // 5) Actualizar facing
        if (ax != 0) right = (ax > 0);

        // 6) Punto de salida del proyectil
        var muzzle_off = 16;
        var sx = x + ax * muzzle_off + weapon_modx * sign(ax == 0 ? (right ? 1 : -1) : ax);
        var sy = y + ay * muzzle_off + weapon_mody;

        // 7) Crear proyectil pesado y darle dirección/velocidad
        var obj = instance_create_layer(sx, sy, "att", o_heavy);
        obj.direction   = point_direction(0, 0, ax, ay);
        obj.speed       = 9;               // más lento que pistol/machine, ajusta a gusto
        obj.image_angle = obj.direction;   // si el sprite debe rotar
    }
}