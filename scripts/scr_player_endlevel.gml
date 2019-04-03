//begins endlevel stuff
if(obj_endcarrot.triggered = 0)
{
    obj_endcarrot.triggered = 1;
    sprite_index = spr_player_endlevel_R;
    image_speed = 0;
    image_index = 0;
    nextlevelframe = image_index;
    sound_played = 0;
}
//increments animation
if(obj_endcarrot.triggered = 1)
{
    nextlevelframe += 0.15; //speed of animation
    if(nextlevelframe > 9) nextlevelframe = 9;
    image_index = nextlevelframe; 
}
//fades to next room
if(nextlevelframe >= 9) //frame of animation that fade begins on
{
    instance_create(0, 0, eff_fadeToBlack);
    if (room_next(room) != -1) {eff_fadeToBlack.newRoom = room_next(room);}
    else eff_fadeToBlack.newRoom = rm_menu;
    if(!audio_is_playing(snd_main)) && (sound_played = 0)
    {
        sound_played = 1;
        audio_sound_pitch(snd_main, 1);
        audio_sound_gain(snd_main, global.gamevolume, 0);
        audio_play_sound(snd_main, 0, 0);
    }
}

scr_player_altmove_collide();
