// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_audio_load_groups(){
	if (!audio_group_is_loaded(audiogroup_music)) {
    audio_group_load(audiogroup_music);
	}
	if (!audio_group_is_loaded(audiogroup_effects)) {
	    audio_group_load(audiogroup_effects);
	}
}