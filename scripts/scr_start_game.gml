if(obj_menu.starttimer = -1) obj_menu.starttimer = 180; //number of frames til start
if(obj_menu.starttimer > -1) obj_menu.starttimer -= 1;
if(obj_menu.starttimer == 0)
{
    obj_menu.starttimer = -2;
    instance_create(0, 0, eff_fadeToBlack);
    eff_fadeToBlack.newRoom = rm_grassy1;
}
