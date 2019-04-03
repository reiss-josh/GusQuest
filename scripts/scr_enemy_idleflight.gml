//script for a mob that flies around idly

//every 2 seconds, chance of changing vdir. increases chance every time failed.
//every 4 seconds, chance of changing hdir. increases chance every time failed.
var randomizer = random(1);
if(vtimer > 119)
{
    if(randomizer < (.75 + (.1 * vfail)))
    {
        vfail = 0;
        vdir *= -1;
    }
    else vfail += 1;
    vtimer = -1;
}
if(htimer > 239)
{
    if(randomizer < (.25 + (.1 * hfail)))
    {
        hfail = 0;
        dir *= -1;
    }
    else hfail += 1;
    htimer = -1;
}

vtimer += 1;
htimer += 1;

if(x < 8) || (x > room_width - 8) {dir *= -1; hsp = 0; x += (dir * 1)}
if(y < 8) || (y > room_height + 8) {vdir *= -1; vsp = 0; y += (dir * 1)}

//Horizontal Collision
hsp += (accel * dir);
if(hsp < -movespeed) hsp = -movespeed;
if(hsp > movespeed) hsp = movespeed;
if(place_meeting(x + hsp, y, par_all_walls))
{
    while(!place_meeting(x + sign(hsp), y, par_all_walls)) {x += sign(hsp);}
    dir *= -1;
    htimer = 0;
    hfail = 0;
    vdir *= -1;
    vtimer = 0;
    vfail = 0;
    hsp = 0;
}
if(deathtimer -1) {hsp = 0;}
x += hsp;

//Vertical Collision
vsp += (vaccel * vdir);
if(vsp < -vmovespeed) vsp = -vmovespeed;
if(vsp > vmovespeed) vsp = vmovespeed;
if(place_meeting(x, y + vsp, par_all_walls))
{
    while(!place_meeting(x, y + sign(vsp), par_all_walls)) {y += sign(vsp);}
    vsp = 0;
    vdir *= -1;
    vtimer = 0;
    vfail = 0;
}
else colliding = false;
y += vsp;

if(hsp > 0) image_xscale = 1;
if(hsp < 0) image_xscale = -1;
