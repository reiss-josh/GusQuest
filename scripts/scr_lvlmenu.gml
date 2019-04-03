switch(mpos)
{
    case 0: if(global.unlocks[0] = true) //grassy1
            {instance_create(0, 0, eff_fadeToBlack); eff_fadeToBlack.newRoom = rm_grassy1;}
            else failed = true; break;
            
    case 1: if(global.unlocks[1] = true) //grassy2
            {instance_create(0, 0, eff_fadeToBlack); eff_fadeToBlack.newRoom = rm_grassy2;}
            else failed = true; break;
            
    case 2: if(global.unlocks[2] = true) //grassy3
            {instance_create(0, 0, eff_fadeToBlack); eff_fadeToBlack.newRoom = rm_grassy3;}
            else failed = true; break;
            
    case 3: if(global.unlocks[3] = true) //grassy4
            {instance_create(0, 0, eff_fadeToBlack); eff_fadeToBlack.newRoom = rm_grassy4;}
            else failed = true; break;
            
    case 4: if(global.unlocks[4] = true) //grassy5
            {instance_create(0, 0, eff_fadeToBlack); eff_fadeToBlack.newRoom = rm_grassy5;}
            else failed = true; break;
            
    case 5: if(global.unlocks[5] = true) //grassy6
            {instance_create(0, 0, eff_fadeToBlack); eff_fadeToBlack.newRoom = rm_grassy6;}
            else failed = true; break;
            
    case 6: if(global.unlocks[6] = true) //grassy7
            {instance_create(0, 0, eff_fadeToBlack); eff_fadeToBlack.newRoom = rm_grassy7;}
            else failed = true; break;
            
    case 7: if(global.unlocks[7] = true) //grassy8
            {instance_create(0, 0, eff_fadeToBlack); eff_fadeToBlack.newRoom = rm_grassy8;}
            else failed = true; break;
            
    case 8: if(global.unlocks[8] = true) //grassy9
            {instance_create(0, 0, eff_fadeToBlack); eff_fadeToBlack.newRoom = rm_grassy9;}
            else failed = true; break;
            
    case 9: if(global.unlocks[9] = true) //grassy10
            {instance_create(0, 0, eff_fadeToBlack); eff_fadeToBlack.newRoom = rm_grassy10;}
            else failed = true; break;
            
    case 10: if(room_next(room) != rm_options) {room_next(room);}
            else {failed = true;} break;
    case 11: room_goto(rm_menu); break;
    default: break;
}
