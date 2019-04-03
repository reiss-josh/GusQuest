scr_enemy_collision();
sprite_index = jumping_self;

if(colliding = true)
{
    if (hp > 1) {state = enemy_states.waiting; waittimer = bighp_landtime; sprite_index = normal_self;}
    else {state = enemy_states.waiting; waittimer = landtime;}
}
if(wall_collide = true) {dir *= -1; wall_collide = false;}
