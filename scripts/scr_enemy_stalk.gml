if(distance_to_object(obj_player) < 96)
{
    if(obj_player.x - 16 > x) dir = 1;
    else if (obj_player.x + 16 < x) dir = -1;   
}
