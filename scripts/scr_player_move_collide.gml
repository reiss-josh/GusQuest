//this is sort of the player's "main()"

scr_player_getinput();
scr_checkif_wall();
////////shooting//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//begin shooting
if (can_shoot = 1) && (key_shoot) && (shoot_cooldown < 0)
    && ((state = states.normal) || ((state = states.jumping)))
    {shoot_frame = 0; shoot_cooldown = 40;}
//shoot animation
if(shoot_cooldown > -1) shoot_cooldown -= 1;
if(shoot_frame > -1)
{
    sprite_index = spr_player_shooting_right;   //set sprites
    shoot_frame += .2;                          //animate sprites
    image_index = shoot_frame;
}
//shoot
if(shoot_frame == 4)
    if(sprdir = 1) instance_create(x + 4, y, obj_carrot);   //shoot bullet on middle frame of animation
    else instance_create(x - 4, y, obj_carrot);
if(shoot_frame == 8) shoot_frame = -1; //reset shooting

///////////////sprint/////friction////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//sprinting
if (key_sprint) movespeed = (sprintspeed);
else movespeed = ogmovespeed;

//apply friction
if (move == 0)
{
    hsp -= (sign(hsp) * frctn)
    if((hsp > 0) && (hsp < (frctn * 2))) hsp = 0;
    if((hsp < 0) && (hsp > (-frctn * 2))) hsp = 0;
}

///////move//collide//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//carry on moving platforms
var hsp_final = hsp + hsp_carry;
hsp_carry = 0;

//Horizontal Collision
if (place_meeting (x + hsp_final, y, obj_wall)) //walls
{
    while(!place_meeting (x + sign(hsp_final), y, obj_wall)) {x += sign(hsp_final);}
    hsp_final = 0;
    if(state = states.jumping)  //if jumping and horiz collision, switch to sliding
    {state = states.sliding; currjumps = 1;}
}
else if (place_meeting (x + hsp_final, y, obj_wall_corner)) //corners
{
    while(!place_meeting (x + sign(hsp_final), y, obj_wall_corner)) {x += sign(hsp_final);}
    hsp_final = 0;
}
else {hcollide = false;}

//analog movement
var gpmovespeed;
if(gamepad_axis_value(0, gp_axislh) != 0) {gpmovespeed = movespeed * gamepad_axis_value(0, gp_axislh);}
else gpmovespeed = movespeed;
if(gpmovespeed < 0) gpmovespeed *= -1;

//water collision
if(place_meeting(x + hsp_final, y, obj_water)) 
{
    if inwater = false
    {
        inwater = true;
        instance_create(x + hsp_final, y, eff_waterpart);
        audio_sound_pitch(snd_waterdrop, 1);
        audio_sound_gain(snd_waterdrop, global.gamevolume, 0);
        audio_play_sound(snd_waterdrop, 0, 0);
    }
    else inwater = true;
}
else inwater = false;
if inwater = true {gpmovespeed *= 0.35;}

//speed limit
if (hsp > gpmovespeed) hsp = gpmovespeed;
if (hsp < -gpmovespeed) hsp = -gpmovespeed;

x += hsp_final; //Move x hspeed

//Vertical Collision
//make platform passthrough if below/down key
with(obj_platform)
{   if(round(other.y + (other.sprite_height/2)) > y || other.key_down)
    {mask_index = -1;}  }
//actual collision
if (place_meeting (x, y + vsp, par_all_walls))
{
    while(!place_meeting (x, y + sign(vsp), par_all_walls)) {y += sign(vsp);}
    vsp = 0;
    if(wall_on_bottom)
    {
        currjumps = 0; //if wall below, set currjumps to 0
        if(state = states.jumping) || (state = states.sliding) {state = states.normal;} //if touching ground, switch to normal state
    }
}
else if(state = states.normal) && (vsp > 0) {currjumps = 1; state = states.jumping;} //if falling, switch to jumping
//finish platform updates
if(place_meeting (x, y - 0.01, obj_platform)) && !(key_down) {y -= 0.5} //get out of platform if in it
with(obj_platform) {mask_index = selfmask;} //make platform solid

y += vsp; //Move vspeed y

if(state != states.sliding) && (slidetime > -1) slidetime = -1;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//change sprite based on direction
if (move > 0) {sprdir = 1; image_xscale = 1;} //right
if (move < 0) {sprdir = 2; image_xscale = -1;} //left

//update sprite based on current actions
if(shoot_cooldown < 0) && (!(key_shoot))
{
    if(state != states.ladder) && (state != states.sliding) image_speed = 0.25;  //if not on ladder, set animation speed
    if(state = states.normal)
    {
        if(hsp = 0)
        {
            sprite_index = spr_player_standing_right;   //standing sprites
            image_speed = 0;
        }
        else sprite_index = spr_player_walking_right; //walking sprites
    }
    if (state = states.jumping)
    {sprite_index = spr_player_jumping_right;}    //jumping sprites
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if(key_quit) state = states.paused;
//if(key_quit) {instance_create(0, 0, eff_fadeToBlack);eff_fadeToBlack.newRoom = rm_menu;} //quit game
