//checks for collision

//left
if (place_meeting (x - 4, y, par_all_walls))    {wall_on_left = true;}
else wall_on_left = false;
//right
if (place_meeting (x + 4, y, par_all_walls))    {wall_on_right = true;}
else wall_on_right = false;
//top
if (place_meeting (x, y - 4 , par_all_walls))   {wall_on_top = true;}
else wall_on_top = false;
//bottom
if (place_meeting (x, y + 4 , par_all_walls))   {wall_on_bottom = true;}
else wall_on_bottom = false;
