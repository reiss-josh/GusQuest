var nextdir = global.mapgrid[#currnode, 4];
var prevdir = global.mapgrid[#currnode, 6];
if((currnode < ds_grid_width(global.mapgrid)) && (dir == nextdir) && (moveable = false))
{
    inc = 1;
    if(global.unlocks[currnode + 1 + world] == true)
    {moveable = true;
    chosedir = nextdir;}
    else {state = states_map.failed; waittime = waitcap;}
}
else if (currnode > 0) && (dir == prevdir) && (moveable = false)
{
    inc = -1;
    if(global.unlocks[currnode - 1 + world] == true)
    {moveable = true;
    chosedir = prevdir;}
    else {state = states_map.failed; waittime = waitcap;}
}
if moveable = true
{
    sprite_index = move_sprite;
    image_speed = move_animspeed;
    if(dir == 0) image_xscale = 1;
    else if(dir == 2) image_xscale = -1;
    var desx = global.mapgrid[# currnode + (1 * inc), 0];
    var desy = global.mapgrid[# currnode + (1 * inc), 1];
    if(chosedir > 1) chosedir -= 2;
    //global.dessx = desx; global.dessy = desy; global.chosedir = chosedir;
    
    if((step == 0 && chosedir = 0) || (step == 1 && chosedir = 1))
    {
        if(x < desx) x += movespeed;
        else if (x > desx) x -= movespeed;
        else{state = states_map.wait; waittime = waitcap;}
    }
    if((step == 1 && chosedir = 0) || (step == 0 && chosedir = 1))
    {
        if(y < desy) y += movespeed;
        else if(y > desy) y -= movespeed;
        else{state = states_map.wait; waittime = waitcap;}
    }
}
else {state = states_map.failed; waittime = waitcap;} //failed
