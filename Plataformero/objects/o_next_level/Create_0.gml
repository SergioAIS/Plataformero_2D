alarm[0] = 100
global.next_level = 0

if (global.previous_room == r_start) global.next_level = "Level 1"
else if (global.previous_room == r_lvl1) global.next_level = "Level 2"
else if (global.previous_room == r_lvl2_finish) global.next_level = "Level 3"