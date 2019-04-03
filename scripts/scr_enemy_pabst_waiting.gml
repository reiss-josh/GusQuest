hspeed = 0;
scr_enemy_collision();
if(distance_to_object(obj_player) <= 32) {image_speed = 0.25; sprite_index = spr_pabst_fall;}
if(image_index >= 10) {image_speed = 0.3; state = enemy_states.normal; sprite_index = spr_pabst_roll;}
