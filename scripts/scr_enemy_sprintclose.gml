//make the paper move faster when closer to the player
if(distance_to_object(obj_player) != 0)
{movespeed = 1/((distance_to_object(obj_player)) / 75);}
if(movespeed < 0.5) movespeed = 0.5;
if(movespeed > 1.5) movespeed = 1.5;
image_speed = movespeed / 10;
