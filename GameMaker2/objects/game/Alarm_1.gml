/// @description NEW GAME set-up

//---------First Set-up---------//
if(flag_firstrun and game_file.newgame==g_curr_file)
{
	//---Init. pre-liminary set-up
	if(0==g_newgame_state){ file_text_write_string(log_file,"\n"); } //extra space for easier reading..
	file_text_write_string(log_file,"G NEWGAME STATE= "+string(g_newgame_state)+"\n");
		
	switch(g_newgame_state){
	//---
	default: {
		file_text_write_string(log_file,"NEW GAME CREATED\n");
		g_curr_state=game_state.statics_viewer; //goto viewer room
		g_load=true; //set stage for load files...
		g_newgame_state=0; //reset for next new game...	
		flag_firstrun=false;
	} break;
	}
} 
else {
	file_text_write_string(log_file,"Error in NEW GAME\n")
	g_exit=true;
}

//---------Restart Alarm?
if(flag_firstrun) alarm[1]=2*room_speed; //check back in 2 sec...
