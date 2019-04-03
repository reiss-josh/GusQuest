scr_player_getinput();
sprite_index = spr_paused;
if((key_quit) || (key_shoot))
{
    instance_activate_all();
    state = states.normal;
    with(obj_options){instance_destroy();}
    with(obj_volume){instance_destroy();}
    with(obj_volumeborder){instance_destroy();}
    with(obj_menublock){instance_destroy();}
}
else if!(instance_exists(obj_options))
{
    instance_deactivate_all(true);
    instance_activate_object(obj_wall);
    instance_activate_object(obj_wall_corner);
    instance_activate_object(obj_platform);
    instance_activate_object(obj_grass);
    instance_activate_object(obj_ladder);
    instance_activate_object(obj_sign);
    instance_create(view_xview[0] + 16, view_yview[0] + 16, obj_options);
    instance_create(obj_options.x + 128, obj_options.y + 64, obj_volume);
    instance_create(obj_options.x + 192, obj_options.y + 64, obj_volumeborder);
    instance_create(obj_options.x - 8, obj_options.y - 8, obj_menublock);
    obj_options.space = 16;
    obj_options.font = fnt_sign;
    obj_options.xoffset = 0;
    obj_options.xspace /= 2;
    obj_options.menu[5] = "Main Menu";
}
