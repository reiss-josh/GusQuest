if(waittime == waitcap / 2)
{
    audio_sound_pitch(snd_main, 0.5);
    audio_sound_gain(snd_main, global.gamevolume, 0);
    audio_play_sound(snd_main, 0, 0);
}
if(waittime > -1) {waittime -= 1;}
else state = states_map.normal;
if(waittime >= waitcap / 2)
{
    if(dir == 0) x += failspeed;
    else if(dir == 1) y += failspeed;
    else if(dir == 2) x -= failspeed;
    else y -= failspeed;
}
else if(waittime >= 0)
{
    if(dir == 0) x -= failspeed;
    else if(dir == 1) y -= failspeed;
    else if(dir == 2) x += failspeed;
    else y += failspeed;
}
