scr_player_getinput();
sprite_index = spr_player_climb_ladder;

//Ladder movement
vmove = (key_up + key_down);
vsp += vmove * accelrate;

//don't exceed max speed
if (vsp > movespeed) vsp = movespeed;
if (vsp < -movespeed) vsp = -movespeed;

//apply vertical friction
if (vmove == 0)
{
    vsp -= (sign(vsp) * frctn)
    if(vsp <= sign(vsp) * frctn) vsp = 0
    image_speed = 0;
}
else image_speed = .3;

//if press spacebar or run out of ladder, launch off
if  (!place_meeting(x, y, obj_ladder))
{
    currjumps = 1;
    state = states.jumping;
}
if (key_jump)
{
    vsp = -jumpspeed / 2;
    currjumps = 1;
    state = states.jumping;
}

//slide left and right
move = (key_left + key_right);
if (move != 0) hsp += move * (accelrate / 2);

scr_player_move_collide();
