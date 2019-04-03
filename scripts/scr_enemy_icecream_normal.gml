//set speed, apply gravity
hsp = 0;
sprite_index = normal_self;

//turn at end of world
if (x + (dir * 32 * movespeed) <= 0 || (x + (dir * 32 * movespeed) >= room_width)) {dir *= -1;}

scr_enemy_collision();
if(wall_collide = true) /*&& !(place_meeting(x, y - 4, par_all_walls))*/ {dir *= -1; wall_collide = false;}
if(place_meeting(x, y + 1, par_all_walls))
{
    colliding = false;
    vsp -= jumpspeed;
    hsp = dir * movespeed;
    state = enemy_states.jumping;
}
