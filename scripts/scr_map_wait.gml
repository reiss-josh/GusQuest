var chosenode = currnode + (1 * inc);
var desx = global.mapgrid[# chosenode, 0];
var desy = global.mapgrid[# chosenode, 1];

sprite_index = norm_sprite;
image_speed = norm_animspeed;

if(waittime > -1) {waittime -= 1;}
else if !(x == desx && y == desy)
{
    state = states_map.move;
    step += 1;
}
else {state = states_map.normal; currnode = chosenode; step = 0;}
