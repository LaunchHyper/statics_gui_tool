/// @description In-Game Save/Load wait

//---------Load
if(g_load_alarm){
	var _g_curr_file = g_curr_file;
	if(0==g_load_state){ file_text_write_string(log_file,"\n"); } //extra space for easier reading..
	file_text_write_string(log_file,"G LOAD STATE= "+string(g_load_state)+"\n");
		
	switch(g_load_state){
	//---
	default: {
		file_text_write_string(log_file,"LOADED\n")
		if(g_pause_state) g_pause=true; //unpause
		g_load_state=0; //reset for next load...
		g_load_alarm=false;		
	} break;
	}
}

//---------Save
if(g_save_alarm){
	if(0==g_save_state){ file_text_write_string(log_file,"\n"); } //extra space for easier reading..
	file_text_write_string(log_file,"G SAVE STATE= "+string(g_save_state)+"\n");
	
	switch(g_save_state){
	//---
	default: {
		var closedWindow=false;
		with(loadsavesystem){
			closedWindow = !showLoadSave;
			if(!closedWindow) showLoadSave=false; //close window if not closed
		}
		//make sure windows closed
		if(closedWindow){
			#region ---screen-shot (camera) for menu viewing
			var sfile = ".\\game"+string(g_curr_file)+"\\gameview.png" // saves to "game_save_id" location
			var s_xsize = x_scale_savewindow*(sprite_get_width(spr_ui_window) -2*CELL_SIZE) - 2*CELL_SIZE; //cut corners off
			var s_ysize = y_scale_savewindow*(sprite_get_height(spr_ui_window)-2*CELL_SIZE) - 2*CELL_SIZE; //...
			var s_x = x;
			var s_y = y;
			screen_save_part(sfile,s_x,s_y,s_xsize,s_ysize);
			#endregion
			file_text_write_string(log_file,"SAVED\n")
			if(g_pause_state) g_pause=true; //unpause
			g_save_state=0; //reset for next save...
			g_save_alarm=false
		}
	}
	}
}

//---------Restart Alarm?
if(g_load_alarm or g_save_alarm) alarm[2]=2*room_speed; //check back in 2 sec...