
if(!dead)
{

// INPUT ---------------------------------------------------

//Weapon Change ----------------------

if(keyboard_check_pressed(ord("1"))) weapon = "pistol";
if(keyboard_check_pressed(ord("2")) and pick_machine) weapon = "machine";
if(keyboard_check_pressed(ord("3")) and pick_heavy) weapon = "heavy";
if(keyboard_check_pressed(ord("4")) and pick_laser) weapon = "laser";


//Movement LEFT RIGHT ----------------

if(keyboard_check(vk_right))
{
	if(x_speed < 0) x_speed = 0;
	if(x_speed < x_speed_max) x_speed += x_accel;
	right = 1;
}

if(keyboard_check(vk_left))
{
	if(x_speed > 0) x_speed = 0;
	if(x_speed > -x_speed_max) x_speed -= x_accel;
	right = 0;
}

if(!keyboard_check(vk_right) and !keyboard_check(vk_left)) x_speed = 0;
if(keyboard_check(vk_right) and keyboard_check(vk_left)) x_speed = 0;

// Crouch ---------------

if(keyboard_check(vk_down))
{
	if(ground)
	{
		crouch = 1;
		x_speed = 0;
		weapon_mody = -14;
	}
}
else
{
	crouch = 0;
	weapon_mody = -25;
}

// Jump -----------------

if(keyboard_check_pressed(vk_alt))
{
	if(ground or coyote_c or dj)
	{
		
		if(!ground and dj){
			dj=0
			part_particles_create(global.part_back,x+hspeed,y-20,global.p_dj,18);
			part_particles_create(global.part_back,x+hspeed,y-20,global.p_dj2,6);
			audio_play_sound(snd_double_jump, 1, 0)
			y_speed = -jump_power+2;
		}
		else
		{
			ground = 0;
			coyote_c = 0;
			audio_play_sound(snd_jump, 1, 0)
			if(crouch)
			{
				if(place_free(x,y+1))
				{
					y += 1;
				}
				else
				{
					y_speed = -jump_power;
				}
			}
			else
			{
				y_speed = -jump_power;
			}
		}
	}
}

if(keyboard_check_released(vk_alt))
{
	if(y_speed < 0) y_speed = 0;
}

// MOVIMEINTO ----------------------------------------------

// REEMPLAZAR la colisión con o_box por esto (antes del movimiento horizontal):

// Colisión con interactables
if (place_meeting(x + x_speed, y, o_interactable)) {
    interactable = instance_place(x + x_speed, y, o_interactable);
    if (interactable != noone) {
        push_dir = sign(x_speed);
        
        // Empujar el objeto si tiene x_speed
        if (variable_instance_exists(interactable, "x_speed")) {
            interactable.x_speed = push_dir * abs(x_speed) * 0.8;
        }
        
        // Detener al jugador si el objeto no puede moverse
        if (place_meeting(interactable.x + push_dir, interactable.y, o_solid) ||
            place_meeting(interactable.x + push_dir, interactable.y, o_terrain)) {
            x_speed = 0;
        }
    }
}

if(x_speed != 0)
{
	if(x_speed > 0)
	{
		move_contact_solid(0,x_speed);
	}
	else
	{
		move_contact_solid(180,abs(x_speed));	
	}
}

if(y_speed != 0)
{
	if(y_speed > 0)
	{
		// Verificar colisión con terrain, solid o interactables
		var collision_down = collision_rectangle(x-12, y-10, x+12, y, o_terrain, 0, 1) ||
		                     collision_rectangle(x-12, y-10, x+12, y, o_solid, 0, 1) ||
		                     collision_rectangle(x-12, y-10, x+12, y, o_interactable, 0, 1);
		
		if(collision_down)
		{
			move_contact_solid(270, y_speed);
		}
		else
		{
			y_speed_temp = round(y_speed);
			
			while((collision_rectangle(x-12, y, x+12, y+y_speed_temp, o_terrain, 0, 1) != noone ||
			       collision_rectangle(x-12, y, x+12, y+y_speed_temp, o_solid, 0, 1) != noone ||
			       collision_rectangle(x-12, y, x+12, y+y_speed_temp, o_interactable, 0, 1) != noone) 
			      && y_speed_temp != 0)
			{
				y_speed_temp -= 1;
			}
			y += y_speed_temp;
		}
	}
	else
	{
		move_contact_solid(90, abs(y_speed));	
	}
}

// CHECKS -------------------------------------------------

if(hp <= 0)
{
	dead = 1;
	invi = 1;
	alarm[1] = -1;
	audio_stop_all()
	audio_play_sound(snd_death, 1, 0)
}

// Detección de suelo mejorada (terrain, solid e interactables)
ground_check = collision_rectangle(x-12, y, x+12, y+1, o_terrain, 0, 1) ||
                   collision_rectangle(x-12, y, x+12, y+1, o_solid, 0, 1) ||
                   collision_rectangle(x-12, y, x+12, y+1, o_interactable, 0, 1);
                   
ceiling_check = collision_rectangle(x-12, y-10, x+12, y, o_terrain, 0, 1) ||
                    collision_rectangle(x-12, y-10, x+12, y, o_solid, 0, 1) ||
                    collision_rectangle(x-12, y-10, x+12, y, o_interactable, 0, 1);

if(y_speed >= 0 && ground_check && !ceiling_check)
{
	ground = 1;
	y_speed = 0;
	coyote_c = 1;
	if(pick_dj) dj = 1;
}
else
{
	ground = 0;
	y_speed += grav;
	if(coyote_c and alarm[11] == -1) alarm[11] = coyote_t;
	
	if(y_speed > fall_max) y_speed = fall_max;
	
	if(!place_free(x, y-1))
	{
		if(y_speed < 0) y_speed = 0;
	}
}

// Weapons ------------------------------------------------
// Actualizar cooldown de melee
if (melee_cooldown > 0) {
    melee_cooldown--;
    melee_active = true; // Mantener modo melee durante el cooldown
} else {
    melee_active = false;
}

// Solo ejecutar si se presiona o mantiene la tecla
if (keyboard_check(vk_control)) {
    // Detectar si hay enemigos cercanos para melee
    enemy_nearby = instance_nearest(x, y, o_enemy_body);
    use_melee = false;
    
    if (instance_exists(enemy_nearby)) {
        dist = point_distance(x, y, enemy_nearby.x, enemy_nearby.y);
        if (dist <= melee_range) {
            use_melee = true;
        }
    }
    
    // Si hay enemigo cerca O todavía está en cooldown de melee, NO disparar
    if (use_melee or melee_active) {
        if (keyboard_check_pressed(vk_control) and melee_cooldown <= 0) {
            scr_melee_attack();
        }
        // NO hacer nada más, no disparar
    }
    // Si NO hay enemigo cerca Y no está en cooldown de melee, disparar normalmente
    else {
        if (can_shoot) {
            switch(weapon) {
                case "pistol":
                    scr_pistol();
                break;
                
                case "heavy":
                    scr_heavy();
                break;
                
                case "laser":
                    scr_laser();
                break;
                
                case "machine":
                    scr_machine_gun();
                break;
            }
        }
    }
}


}
else
{
	
	image_alpha -= 0.004;

	if(image_alpha <= 0)
	{
		

		// RESPAWN -------------------
		global.player_respawn = 1;
		hp = hpMax;
		dead = 0;
		invi = 0;
		dj = 0
		pick_dj = 0
		room_goto(global.checkpoint);
	}
}
