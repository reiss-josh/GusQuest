switch(mpos)
{
    case 0: obj_menu.starttimer = -1; break;
    case 1: continuing = true; break;
    case 2:
        if(global.unlocks[0] == true) {global.zone = "lvlselect";room_goto(rm_lvlselect);}
        else {audio_sound_pitch(snd_main, 0.5);
            audio_sound_gain(snd_main, global.gamevolume, 0);
            audio_play_sound(snd_main, 0, 0);}
        break;
    case 3: scr_loadgame(); break;
    case 4: room_goto(rm_options); break;
    case 5: game_end(); break;
    default: break;
}
