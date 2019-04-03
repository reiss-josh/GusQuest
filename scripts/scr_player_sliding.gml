scr_player_getinput();
scr_checkif_wall();

if(slideframe < 0) {slideframe = 0;}

if(slideframe < 2) {slideframe += .25;}

hsp = 0;
falltime = 0;
slidetime += 1;

if(wall_on_left || wall_on_right) sprite_index = spr_player_sliding_right;
if(wall_on_left = true) {image_xscale = -1;}
if(wall_on_right = true) {image_xscale = 1;}

image_index = slideframe;

vsp += slidefriction;
if(vsp > 10) {vsp = 10;}

if(key_jump)
{
    if (wall_on_right) hsp = -movespeed;
    if (wall_on_left) hsp = movespeed;
    currjumps = 0;
    slideframe = -1;
    scr_player_jump();
}

if (-(key_left) && (!wall_on_left)) || ((key_right) && (!wall_on_right)) || (slidetime > maxslide  && !key_right && !-key_left)
{
    state = states.jumping;
    walkedslide = 10;
    currjumps = 1;
    slideframe = -1;
}

if ((vsp < 0) && (key_jump_released)) {vsp = max(vsp, (-jumpspeed / 4))} //held jump

scr_player_move_collide();
