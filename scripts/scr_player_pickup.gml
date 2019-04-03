//set up the animation
if(grabbed_item = 1) //key1
{
    //direction
    sprite_index = spr_player_pickup_key1_R;
    //animation
    image_speed = 0;
    pickupframe = 0;
    maxpickupframe = 11;
    pickupspeed = 0.1;
    //sound
    pickupsnd = snd_main;
    pickuppitch = 2.5;
}
if(grabbed_item = 2) //speedyboots
{
    //attribute
    global.sprintspeed = 4.5;
    sprintspeed = global.sprintspeed;
    //direction
    sprite_index = spr_player_pickup_speedyboots_R;
    //animation
    image_speed = 0;
    pickupframe = 0;
    maxpickupframe = 9;
    pickupspeed = 0.1;
    //sound
    pickupsnd = snd_main;
    pickuppitch = 2.5;
}
if(grabbed_item = 3) //carrotgun
{
    //attribute
    global.can_shoot = 1;
    can_shoot = global.can_shoot;
    //direction
    sprite_index = spr_player_pickup_carrotgun_R;
    //animation
    image_speed = 0;
    pickupframe = 0;
    maxpickupframe = 11;
    //sound
    pickupspeed = 0.1;
    pickupsnd = snd_main;
    pickuppitch = 2.5;
}
grabbed_item = 0;

//do the animation
image_index = pickupframe;
if(pickupframe > -1) pickupframe += pickupspeed; //animation speed

//end the animation / play the sound
if (pickupframe >= maxpickupframe)
{
    audio_sound_pitch(pickupsnd, pickuppitch);
    audio_sound_gain(pickupsnd, global.gamevolume, 0);
    audio_play_sound(pickupsnd, 0, 0);
    state = states.normal;
    pickupframe = -1;
}

scr_player_altmove_collide();
