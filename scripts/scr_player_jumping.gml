scr_player_getinput();
scr_checkif_wall();

//Horizontal Movement
move = (key_left + key_right);
hsp += move * accelrate;

//apply gravity
if (vsp < 10) vsp += (grav); //fall faster over time someday

if (walkedslide > 0)
{
    if(key_jump) currjumps -= 1;
    walkedslide -= 1;
}

if (place_meeting(x, y, obj_ladder) && (-(key_up) || (key_down)))
{
    hsp /= 2;
    vsp /= 4;    
    state = states.ladder;
}

//if (place_meeting (x, y + vsp, obj_wall) && (wall_on_bottom)) {currjumps = 0;}

if ((currjumps < maxjumps) && (key_jump) && (jumptimer < 1)) scr_player_jump(); //jump
if ((vsp < 0) && (key_jump_released)) {vsp = max(vsp, (-jumpspeed / 4))} //held jump

scr_player_move_collide();
