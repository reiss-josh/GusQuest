if(dying = 30)
{
    //direction
    sprite_index = spr_player_dying_right;
    //animation
    image_index = 0;
    image_speed = 0.09;
    //sound
    audio_sound_pitch(snd_squish, 0.5);
    audio_sound_gain(snd_squish, global.gamevolume, 0);
    audio_play_sound(snd_squish, 0, 0);
}
if(dying > -1) {dying -= 1;}//decrement timer
if(dying = 15)
{
    instance_create(0, 0, eff_fadeToBlack);
    eff_fadeToBlack.newRoom = 0;
    eff_fadeToBlack.fade = 3;
    dying = -10;
}

scr_player_altmove_collide();
