hsp = 0;
scr_enemy_collision();
if(waittimer > -1) waittimer -=1;
if(waittimer < 0) state = enemy_states.normal;

if(flash_color == c_red) sprite_index = spr_squirrel_msquish;
else sprite_index = spr_squirrel_angry_landing;
