//script for making a mob jump when very close to player

if(distance_to_object(obj_player) != 0)
{
    if(distance_to_object(obj_player) < 32) && (colliding = true)
    {
        colliding = false;
        movespeed = 2;
        vsp -= 3;
        state = enemy_states.jumping;
    }
}

if(colliding = true) movespeed = 1.5;
if(dir = -1) image_xscale = -1;
else image_xscale = 1;
