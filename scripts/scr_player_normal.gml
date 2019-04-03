scr_player_getinput();

//Horizontal Movement
move = (key_left + key_right);
hsp += move * accelrate;

//Jumping
if (place_meeting(x, y + 1, par_all_walls)) && (key_jump)
{scr_player_jump();}

//apply gravity
if (vsp < 10) vsp += (grav);

if (place_meeting(x, y, obj_ladder) && -(key_up))
{
    hsp /= 2;
    vsp /= 4;    
    state = states.ladder;
}

scr_player_move_collide();
