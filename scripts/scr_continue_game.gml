//updates room that player should be sent to when they hit continue
continueroom = 0;
var w;
for (w = 0; w < array_length_1d(global.unlocks); w += 1)
{
    if(global.unlocks[w] == false)
    {
        if(w == 0) {continueroom = -1; break;}
        if(w == 1) {continueroom = rm_grassy1; break;}
        if(w == 2) {continueroom = rm_grassy2; break;}
        if(w == 3) {continueroom = rm_grassy3; break;}
        if(w == 4) {continueroom = rm_grassy4; break;}
        if(w == 5) {continueroom = rm_grassy5; break;}
        if(w == 6) {continueroom = rm_grassy6; break;}
        if(w == 7) {continueroom = rm_grassy7; break;}
        if(w == 8) {continueroom = rm_grassy8; break;}
        if(w == 9) {continueroom = rm_grassy9; break;}
        if(w == 10) {continueroom = rm_grassy10; break;}
        if(w == 11) {continueroom = rm_kerr1; break;}
        /*if(w == 12) {continueroom = rm_kerr2; break;}
        if(w == 13) {continueroom = rm_kerr3; break;}
        if(w == 14) {continueroom = rm_kerr4; break;}
        if(w == 15) {continueroom = rm_kerr5; break;}
        if(w == 16) {continueroom = rm_kerr6; break;}
        if(w == 17) {continueroom = rm_kerr7; break;}
        if(w == 18) {continueroom = rm_kerr8; break;}
        if(w == 19) {continueroom = rm_kerr9; break;}*/
    }
}
if(continueroom == 0) continueroom = rm_grassy10;

continuing = false;
if(continueroom == -1)
{
    audio_sound_pitch(snd_main, 0.5);
    audio_sound_gain(snd_main, global.gamevolume, 0);
    audio_play_sound(snd_main, 0, 0);
}
else
{
    instance_create(0, 0, eff_fadeToBlack);
    eff_fadeToBlack.newRoom = continueroom;
}
