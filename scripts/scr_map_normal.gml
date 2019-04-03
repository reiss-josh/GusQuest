sprite_index = norm_sprite;
image_speed = norm_animspeed;
moveable = false;
scr_player_getinput();
if(key_right)
{state = states_map.move; dir = 0;}
if(key_down)
{state = states_map.move; dir = 1;}
if(-key_left)
{state = states_map.move; dir = 2;}
if(-key_up)
{state = states_map.move; dir = 3;}
if(key_shoot)||(key_quit){room_goto(rm_menu);}

if  (place_meeting(x, y, obj_mapnode) || (place_meeting(x, y, obj_mapnode_s))) && (key_jump)
{
    if(global.unlocks[currnode+world] = true)
    {
        instance_create(0, 0, eff_fadeToBlack);
        eff_fadeToBlack.newRoom = (global.mapgrid[# currnode, 5]);
    }
    else
    {
        audio_sound_pitch(snd_main, 0.5);
        audio_sound_gain(snd_main, global.gamevolume, 0);
        audio_play_sound(snd_main, 0, 0);
    }
}
