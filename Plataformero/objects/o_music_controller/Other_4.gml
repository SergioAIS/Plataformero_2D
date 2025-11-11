// Evento Room Start en o_musicController
switch(room)
{
    case r_start:
        audio_stop_all();
        audio_play_sound(snd_Title_Theme, 1, true);
    break;
    
    case r_lvl1:
        audio_stop_all();
        audio_play_sound(snd_lvl_1, 1, true);
    break;
    
    //case r_boss:
    //    audio_stop_all();
    //    audio_play_sound(snd_boss_theme, 1, true);
    //break;
	
	//case r_final:
	//	audio_stop_all()
	//break;
}
