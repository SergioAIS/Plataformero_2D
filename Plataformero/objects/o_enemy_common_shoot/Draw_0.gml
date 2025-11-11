// ========== DRAW EVENT ==========
// Sprite Checks (basado en estados de movimiento)
if (!dead)
{
	if (ground) {
	    if (move_speed == 0) {
	        sprite_index = s_enemy_stand;
	    } else {
	        sprite_index = s_enemy_walk;
	    }
	} else {
	    if (y_speed >= 0) {
	        sprite_index = s_enemy_fall;
	    } else {
	        sprite_index = s_enemy_jump;
	    }
	}

	// Voltear sprite según dirección
	if (direction_facing == 1) {
	    image_xscale = 1;
	} else {
	    image_xscale = -1;
	}
}
else
{
	sprite_index = s_enemy_death
}
draw_self();
