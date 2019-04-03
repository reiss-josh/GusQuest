scr_player_getinput();

//increment jumps and set speed to jumpspeed
currjumps += 1;
if(currjumps == 1)
{
    vsp = key_jump * (-jumpspeed);
    jumptimer = 10;
}
else
{
    vsp = key_jump * (-jumpspeed / 1.25);
    jumptimer = 30;
}

//play jump sound
audio_sound_pitch(snd_main, 5);
audio_sound_gain(snd_main, global.gamevolume, 0);
audio_play_sound(snd_main, 0, 0);

state = states.jumping;

scr_player_move_collide();
