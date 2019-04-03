hsp = 0;
scr_enemy_collision();
if(waittimer > -1) waittimer -=1;
if(waittimer < 0) state = enemy_states.normal;
