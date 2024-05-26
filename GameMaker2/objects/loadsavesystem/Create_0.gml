depth = -1; //on top of lighting
#region NOTE: these should be modified in game obj
scale = game.scale;
showLoadSave = false;
#endregion


//---------Window settings
sprite = spr_ui_window;
sprite_ind = game.ui_window_ind;
UI_width = sprite_get_width(sprite);
UI_height = sprite_get_height(sprite);
scale_x = game.scale; //will be changed by game
scale_y = game.scale; //will be changed by game

UI_x = 0; //will be changed by game
UI_y = 0; //will be changed by game
UI_text_maxWidth = 0; //will be changed by game
UI_text_maxHeight= 0; //will be changed by game
//---
UI_text_maxLines = 1; //updated in game

x_buffer = 15;
y_buffer = 4;

#region general window settings
UI_header_font = fnt_text_24;
draw_set_font(UI_header_font);
UI_header_textHeight = string_height("M");
UI_font = fnt_text_12;
draw_set_font(UI_font);
UI_font_textHeight = string_height("M");

text_x = 0; //set by game
text_y = 0; //set by game

text_c		= c_black;
choice_c	= c_white;
#endregion

//---------Options
#region Options text display functionality
o_choice0	= 0;
o_choice1   = 0;
o_text[0]	= [];	//what option to select? save, load, ...
o_text[1]	= [];	//what specific sub-option to select, i.e. for save/load what file?
o_page		= 0;	//what option view? (0) overall, (1) sub-option

o_pchoice1 = 0;
o_game_file = -1;
o_gameimage = -1;

o_header_text = "Game Options";

o_text[0] = ["RETURN TO GAME",
			"SAVE GAME",
			"LOAD GAME",
			"EXIT TO MAIN MENU",
			"EXIT TO DESKTOP"];

o_text[1] = [
			//---
			//return game sub-options
			["cancel",
			"return to game..."],
			//save game sub-options
			["cancel",
			"game1",
			"game2",
			"game3",
			"game4"],
			//load game sub-options
			["cancel",
			"game1",
			"game2",
			"game3",
			"game4"],
			//exit main menu sub-options
			["cancel",
			"continue to main menu..."],
			//exit game
			["cancel",
			"exit game..."]
			//---
			];
			
o_text_array = [];
o_text_array_len = 0;


loadedOptions = false;
o_changePage = true; //load first time...
#endregion
event_perform(ev_other, ev_user1); //update SAVE/LOAD gameview options
