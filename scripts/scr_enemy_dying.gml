sprite_index = squished_self;
if(deathtimer > -1)
{
    deathtimer -= death_animspeed; //decrement deathtimer
    image_index = death_animframes - deathtimer;
}
if(deathtimer = 0) instance_destroy(); //die after deathtimer

scr_enemy_collision();
