//gravity
if(vsp < 10) vsp += grav;

//Horizontal Collision
if(place_meeting(x + hsp, y, obj_wall))
{
    while(!place_meeting(x + sign(hsp), y, obj_wall)) {x += sign(hsp);}
    hsp = -(hsp/2);
    wall_collide = true;
}
else if(place_meeting(x + hsp, y, obj_wall_corner))
{
    while(!place_meeting(x + sign(hsp), y, obj_wall_corner)) {x += sign(hsp);}
    hsp = -(hsp/2);
    wall_collide = true;
}
if(deathtimer -1) {hsp = 0;}
x += hsp;

//Vertical Collision
if(place_meeting(x, y + vsp, obj_wall))
{
    while(!place_meeting(x, y + sign(vsp), obj_wall)) {y += sign(vsp);}
    vsp = 0;
    colliding = true;
}
else if(place_meeting(x, y + vsp, obj_wall_corner))
{
    while(!place_meeting(x, y + sign(vsp), obj_wall_corner)) {y += sign(vsp);}
    vsp = 0;
    colliding = true;
}
//fear of heights
if ((fearofheights)
    && !position_meeting(   x + (sprite_width / 2) * dir,
                            y + (sprite_height / 2) + 4, obj_wall)
    && !position_meeting(   x + (sprite_width / 2) * dir,
                            y + (sprite_height / 2) + 4, obj_platform)
    && !position_meeting(   x + (sprite_width / 2) * dir,
                            y + (sprite_height / 2) + 4, obj_m_platform_h)
    && !position_meeting(   x + (sprite_width / 2) * dir,
                            y + (sprite_height / 2) + 4, obj_wall_corner))
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
        //instance_create(x + (sign(hsp) * 6), y, obj_carrot_poof);
        
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

if(iframes > -1)
{
    flash_color = c_red;
    iframes -= 1;
}
else flash_color = c_white;
