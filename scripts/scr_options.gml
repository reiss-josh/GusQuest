switch(mpos)
{
    case 0: {window_set_fullscreen(true); window_set_size(1120, 656); centered = 10;} break;
    case 1: {window_set_fullscreen(false); window_set_size(1680, 984); centered = 10;} break;
    case 2: {window_set_fullscreen(false); window_set_size(1120, 656); centered = 10;} break;
    case 3: {window_set_fullscreen(false); window_set_size(560, 328); centered = 10;} break;
    case 4: {global.gamevolume += (0.25);
            if(global.gamevolume > 2) {global.gamevolume = 0;}
            audio_sound_pitch(snd_main, 5);
            audio_sound_gain(snd_main, global.gamevolume, 0);
            audio_sound_gain(menu_theme_sillyfun, global.gamevolume, 0);
            audio_sound_gain(game_theme_pookatori, global.gamevolume * 0.5, 0);
            audio_play_sound(snd_main, 0, 0);} break;
    case 5: room_goto(rm_menu); break;
    default: break;
}
