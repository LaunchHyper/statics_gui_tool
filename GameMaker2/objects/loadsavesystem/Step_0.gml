/// @description Operate on options such as save/load


//---------Skip Below if options not visible---------//
if(!showLoadSave) exit;

//Get interaction key input
var enable_key = keyboard_check_pressed(game.interact_key);
var u_key = keyboard_check_pressed(game.up_key);
var d_key = keyboard_check_pressed(game.down_key);


//---------Options (save/load/exit to menu)
if(!loadedOptions){
	event_perform(ev_other, ev_user1); //update SAVE/LOAD gameview options
	loadedOptions=true;
}
	
if(o_changePage){
	//reset selection for page1, sub-options
	o_choice1 = 0;
		
	//get current options page info
	if(o_page==1) o_text_array = o_text[o_page][o_choice0]; //sub-options has multiple
	else o_text_array = o_text[o_page]; //options
	o_text_array_len = array_length(o_text_array);
	if(game.debug){
		file_text_write_string(game.log_file,"Options["+string(o_choice0)+"] = "+string(o_text_array)+"\n");
		file_text_write_string(game.log_file,"Options size = "+string(o_text_array_len)+"\n");
	}
	o_changePage = false;
}
	
if(o_page==0){		
	//update current option selection (page0), do wrap-around
	o_choice0 += d_key - u_key;
	if(o_choice0 < 0) o_choice0 = o_text_array_len-1
	else if(o_choice0 > o_text_array_len-1) o_choice0 = 0;
		
	//check if need to change page
	if(enable_key){
		o_changePage = true;
		o_page=1;
	}
		
} else
if(o_page==1){
	//update current option selection (page1), do wrap-around
	o_choice1 += d_key - u_key;
	if(o_choice1 < 0) o_choice1 = o_text_array_len-1;
	else if(o_choice1 > o_text_array_len-1) o_choice1 = 0;
		
	//obtain gameimage if exists
	if( o_text[0][o_choice0]=="SAVE GAME" or o_text[0][o_choice0]=="LOAD GAME" ){
		if( o_pchoice1 != o_choice1 ){
			o_game_file = o_text_array[o_choice1];
			event_perform(ev_other, ev_user2);
		}
		o_pchoice1 = o_choice1;
	} 
	else if( o_gameimage != -1 ){
		sprite_delete(o_gameimage);
		o_gameimage = -1;
	}
		
	//perform action on selection
	if(enable_key){
		//change page regardless of option
		o_changePage = true;
		o_page=0;
			
		var close_window_flag=false;
		//exit to main menu room
		if( o_text_array[o_choice1]=="continue to main menu..." ){
			if(game.debug) file_text_write_string(game.log_file,"EXIT TO MAIN MENU\n");
			with(game){ g_curr_state=game_state.main_menu; }
			close_window_flag=true;
		} 
		//exit to desktop (exit game)
		else if( o_text_array[o_choice1]=="exit game..." ){
			with(game){ g_exit=true; }
			close_window_flag=true;
		}
		//exit back to game
		else if( o_text_array[o_choice1]=="return to game..." ){
			if(game.debug) file_text_write_string(game.log_file,"BACK TO GAME\n");
			close_window_flag=true;
		}
		//default: save or load
		else if( o_choice1>0 ) {				
			var _game_file = o_game_file;
			if( o_text[0][o_choice0]=="SAVE GAME" ){
				_game_file = "game"+string(o_choice1);
			}
			with(game){
				switch(_game_file){						
					case "game1":	g_curr_file = game_file.file1;break;
					case "game2":	g_curr_file = game_file.file2;break;
					case "game3":	g_curr_file = game_file.file3;break;
					case "game4":	g_curr_file = game_file.file4;break;
				}
				file_text_write_string(log_file,"Game = "+string(g_curr_file)+"\n");
			}
			close_window_flag=true //assume it's good to close...
			//---
			if( o_text[0][o_choice0]=="SAVE GAME" ){
				file_text_write_string(game.log_file,"Saving... "+string(o_text_array[o_choice1])+"\n");
				with(game){ g_save=true; } //let game obj take care of it
					
			} else
			if( o_text[0][o_choice0]=="LOAD GAME" and -1!=o_gameimage ){
				file_text_write_string(game.log_file,"Loading... "+string(o_text_array[o_choice1])+"\n");
				with(game){ g_load=true; } //let game obj take care of it
			} 
			//---Some Error? Clicking "Load Empty" perhaps...
			else {
				close_window_flag=false;
				o_changePage = false; //don't change page, might need to change later...
				o_page=1;
			}
			
		}
		//exit to menu, exit game, or save/load then close window (and open menu button)
		if(close_window_flag){
			if(game.debug) file_text_write_string(game.log_file,"Closing loadsavesystem window...\n")
			showLoadSave=false;
			if(instance_exists(obj_menugame)){ with(obj_menugame){flag_menu_on=false;}; }
		}
			
		loadedOptions=false; //needed to fix loading bug when going to page0 from page1
	}
}

