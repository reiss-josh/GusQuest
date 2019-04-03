//name is self-descriptive

//gravity
if(vsp < 10) vsp += grav;

//Horizontal Collision
hsp = hsp + hsp_carry;
if(place_meeting(x + hsp, y, par_all_walls))
{
    while(!place_meeting(x + sign(hsp), y, par_all_walls)) {x += sign(hsp);}
    if(state = enemy_states.jumping) hsp = -(hsp/2);
    else hsp = 0;
    wall_collide = true;
}
if(deathtimer -1) {hsp = 0;}
x += hsp;

//Vertical Collision
if(place_meeting(x, y + vsp, par_all_walls))
{
    while(!place_meeting(x, y + sign(vsp), par_all_walls)) {y += sign(vsp);}
    vsp = 0;
    colliding = true;
}
else colliding = false;
//fear of heights
if ((fearofheights != 0) && !(position_meeting(x + (sprite_width / 2) * dir, y + (sprite_height / 2) + 4, par_all_walls)))
    {dir *= -1;}
y += vsp;

//Player Collision
if (place_meeting(x, y, obj_player)) && (deathtimer == -1) && (iframes < 0)
{   //player wins
    if (obj_player.y < y - 8)
    {
        with(obj_player)
        {
            currjumps = 1;
            vsp = -jumpspeed * .6;
        }
        audio_sound_pitch(deathsound, deathpitch);
        audio_sound_gain(deathsound, global.gamevolume, 0);
        audio_play_sound(deathsound, 0, 0);
        hp -= 1;
        if (hp < 1)
        {deathtimer = death_animframes; state = enemy_states.dying;
        sprite_index = squished_self; image_speed = 0;}
        else{iframes = 40; state = enemy_states.waiting; waittimer = 30;}
    }
    else obj_player.alive = false; //player loses
}
//Carrot Collision
if(place_meeting(x, y, obj_carrot))
{
    with(other) instance_destroy(); //destroy the carrot
    instance_create(x + (sign(hsp) * 1), y, obj_carrot_poof); //make a poof
    if(deathtimer = -1) && (iframes < 0) //start death
    {
        audio_sound_pitch(deathsound, deathpitch);
        audio_sound_gain(deathsound, global.gamevolume, 0);
        audio_play_sound(deathsound, 0, 0);
        hp -= 1;
        if (hp < 1)
        {deathtimer = death_animframes; state = enemy_states.dying;
        sprite_index = squished_self; image_speed = 0;}
        else{iframes = 40; state = enemy_states.waiting; waittimer = 30;}
    }
    death_animframes = death_animframes;
}
if(iframes > -1)
{
    flash_color = c_red;
    iframes -= 1;
}
else flash_color = c_white;
