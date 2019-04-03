if file_exists("Save.sav")
{
    var LoadFile = file_text_open_read("Save.sav");
    //load attributes
    global.can_shoot = file_text_read_real(LoadFile);
    global.sprintspeed = file_text_read_real(LoadFile);
    //load level progress
    var m;
    for(m = 0; m < array_length_1d(global.unlocks); m += 1)
    {global.unlocks[m] = file_text_read_real(LoadFile);}
}
else
{
    audio_sound_pitch(snd_main, 0.5);
    audio_sound_gain(snd_main, global.gamevolume, 0);
    audio_play_sound(snd_main, 0, 0);
}
