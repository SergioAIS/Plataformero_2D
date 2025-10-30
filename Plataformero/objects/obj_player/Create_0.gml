//Stats
hpMax = 40
hp = hpMax
inviTime = 45

//Movimiento

xSpeed = 0
xSpeedMax = 5.5
xAccel = 0.5

ySpeed = 0
fallMax = 11
jumpPower = 10

grav = 0.4

//Control
ground = 0
crouch = 0
right = 1
invi = 0
death = 0
/// Create de obj_player (añade esto)
if (!variable_global_exists("has_djump")) global.has_djump = false  // se activa con el powerup
djump_available = global.has_djump   // si ya estaba activo, habilita de entrada
jump_count = 0


//Weapons
weapon = "pistol"
canShoot = 1
weapon_ModX = 15
weapon_ModY = -25
reloadSpeed = 35
reloadSpeedMachine = 15


