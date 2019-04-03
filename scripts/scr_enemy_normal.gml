//set speed, apply gravity
hsp = dir * movespeed;
sprite_index = normal_self;

//turn at end of world
if!(x + (dir * movespeed) >= 0 && (x + (dir * movespeed) <= room_width)) {dir *= -1;}

scr_enemy_collision();
if(wall_collide = true) {dir *= -1; wall_collide = false;}
