// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pistol(){
		bullet = instance_create_layer(x + weapon_ModX * image_xscale, y + weapon_ModY, "att", o_pistol)
		bullet.image_xscale = image_xscale
		bullet.hSpeed *= image_xscale
		canShoot = 0
		alarm[0] = reloadSpeed
}