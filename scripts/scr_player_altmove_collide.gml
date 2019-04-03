//alternate "main()" for when player is in a special state (dying, picking things up)

//apply friction
hsp -= (sign(hsp) * frctn)
if(hsp > 0) && (hsp < (frctn * 2)) hsp = 0;
if(hsp < 0) && (hsp > (-frctn * 2)) hsp = 0;

//apply gravity
if (vsp < 10) vsp += (grav); //fall faster over time someday

//Horizontal Collision
if (place_meeting (x + hsp, y, par_all_walls))
{
    while(!place_meeting (x + sign(hsp), y, par_all_walls)) {x += sign(hsp);}
    hsp = 0;
}
x += hsp;

//Vertical Collision
with(obj_platform)
{
    if(round(other.y + (other.sprite_height/2)) > y || other.key_down)
    {mask_index = -1;}
}
if (place_meeting (x, y + vsp, par_all_walls)) //wall
{
    while(!place_meeting (x, y + sign(vsp), par_all_walls)){y += sign(vsp);}
    if(wall_on_bottom) currjumps = 0;   //if wall below, set currjumps to 0
    vsp = 0;
}
with(obj_platform) {mask_index = selfmask;}
y += vsp;
