/// @description Process All Game Events
//---------Cursor display updates
var click = device_mouse_check_button_pressed(0, mb_left);
if(click){
	curr_cursor_event=cursor_event.normal_click;
	alarm[3]=1; //goto cursor effects timer...
}


//---------CLEAN-UP CHECKS and others---------//
if(g_exit){
	//...
	
	//---close game
	file_text_write_string(log_file,"EXIT GAME\n")
	game_end();
	g_exit=false;
}

//---------MAIN GAME BUTTONS
if(keyboard_check_pressed(debug_key))	{ debug = !debug; file_text_write_string(log_file,"DEBUG trigger\n"); }
//if(keyboard_check_pressed(ord("R")))	{ game_restart(); }
//if(keyboard_check_pressed(vk_escape))	{ game_end(); }


//---------MAIN MENU STATE------------//
switch(g_curr_state){
//---END at MENU
case game_state.main_menu: {
	if(!flag_firstrun and rm_menu!=room){
		file_text_write_string(log_file,"Game room goto <rm_menu>\n");
		room_goto(rm_menu); 
	}
} break;
//---END at GAMEPLAY-1: DESIGNER
case game_state.statics_viewer: {
	if( (!g_load and !g_load_alarm and !g_save and !g_save_alarm) and rm_menu_design!=room){
		file_text_write_string(log_file,"Game room goto <rm_menu_design>\n");
		room_goto(rm_menu_design);
	}
} break;
}

//---------MAIN MENU OPTIONS
if(g_newgame){
	g_load = false; //clear just in case...
	g_save = false;
	
	flag_firstrun=true;
	alarm[1]=1; //go-to checker...
	g_newgame=false;
}

//---don't process below if in menu---//
if(g_curr_state == game_state.main_menu) exit; 
//---------MAIN GAMEPLAY------------//
//---------Save/Load SYS
if(g_load){	
	g_load_alarm = true;
	alarm[2]=1; //go-to checker...
	g_load=false;
}
if(g_save and g_curr_file != game_file.newgame){
	g_save_alarm = true;
	alarm[2]=1; //go-to checker...
	g_save=false;
}

//---------Pause Sys UPDATE---------//
if(g_pause){	
	g_pause_state = !g_pause_state; //update in pause state
	
	if(g_pause_state)	file_text_write_string(log_file,"GAME PAUSED\n")
	else				file_text_write_string(log_file,"GAME UNPAUSED\n")
	g_pause = false;
}
//---------NOT IN PAUSE
if( !g_pause_state )
{
	//
}
