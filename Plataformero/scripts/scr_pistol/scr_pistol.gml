// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pistol(){
	can_shoot = 0;
	alarm[0] = 35; // reload / cooldown

	// 1) Leer input de apuntado (flechas) — puedes cambiar a WASD si prefieres
	var ax = keyboard_check(vk_right) - keyboard_check(vk_left);
	var ay = keyboard_check(vk_down)  - keyboard_check(vk_up);

	// 2) Bloquear disparo hacia abajo si estás en el suelo
	if (ay > 0 && ground) ay = 0;

	// 3) Si no se presiona nada para apuntar, usar la dirección de mirada actual
	if (ax == 0 && ay == 0) {
	    ax = (right) ? 1 : -1;
	    ay = 0;
	}

	// 4) Normalizar vector (para que diagonales no sean más rápidas)
	var len = point_distance(0, 0, ax, ay);
	ax /= len;
	ay /= len;

	// 5) Actualizar "right" si hay componente horizontal (para animaciones/flip)
	if (ax != 0) right = (ax > 0);

	// 6) Posición de salida del disparo (ligero offset frente al jugador)
	var muzzle_off = 16;
	var sx = x + ax * muzzle_off + weapon_modx * sign(ax == 0 ? (right ? 1 : -1) : ax);
	var sy = y + ay * muzzle_off + weapon_mody;

	// 7) Crear bala y darle dirección/velocidad uniforme
	var obj = instance_create_layer(sx, sy, "att", o_pistol);
	obj.direction = point_direction(0, 0, ax, ay);
	obj.speed = 12; // ajusta a tu gusto
	obj.image_angle = obj.direction; // opcional, por si el sprite debe rotar

	audio_play_sound(snd_shot_1, 1, 0);
}