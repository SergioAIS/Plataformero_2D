
//stats ------------------------------------

hpMax = 60;
hp = hpMax;
invi_time = 45;

//movimiento -------------------------------

dj = 0;
pick_dj = 0


x_speed = 0;
x_speed_max = 3.5;
x_accel = 0.5;

ground = 0;
crouch = 0;

y_speed = 0;
fall_max = 11;
jump_power = 10;
grav = 0.4;
coyote_t = 10;
coyote_c = 1;

// weapons ---------------------------------

weapon = "pistol"; // pistol, heavy, laser
can_shoot = 1;

pick_heavy = 0;
ammo_heavy = 0;

pick_laser = 0;
ammo_laser = 0;

pick_machine = 0
ammo_machine = 0

weapon_modx = 15;
weapon_mody = -25;

//control ----------------------------------

dead = 0;
invi = 0;
right = 1;

// Sistema de melee
melee_range = 60; // Distancia para detectar enemigos cercanos
melee_cooldown = 0; // Timer para evitar spam
melee_cooldown_max = 20; // Frames entre ataques melee (20 = ~0.33 seg)
melee_damage = 25; // Daño del ataque melee
melee_knockback = 8; // Fuerza del golpe
