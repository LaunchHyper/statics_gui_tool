/// @description Pre-Room Set-ups 
//file_text_write_string(log_file,"RM SIZE x<"+string(room_width)+"> y<"+string(room_height)+">\n")
//---

g_pause_state=true; //set pause here...
//close windows
with(loadsavesystem){ showLoadSave=false; } 
//disable drawings
with(structuresystem){ showStructures=false; }
//prelim stuff
var ind=WINDOW_INDEX;
ui_window_ind = ind; //set correct ui layout based on race

switch(room){
//---MENU RMS
	case rm_menu: {
	//set-up intro menu page
	with(obj_menu_title){
		draw_set_font(font)
		var text_width = string_width(text);
		x = ROOM_SIZE_X - text_width;
		if(0<x) x = floor(x/2); //put in the center-ish
		else x=0;
	}
	//set-up load
	var _src_width = floor((2/3)*ROOM_SIZE_X);
	var _src_height = floor((1/2)*ROOM_SIZE_Y);
	var sx, sy;
	with(obj_menu_loadgame){
		//large window
		var maxWidth = _src_width;
		var maxHeight = _src_height;
		scale_x = floor( (maxWidth ) / (sprite1Width -2*CELL_SIZE) );
		scale_y = floor( (maxHeight) / (sprite1Height-2*CELL_SIZE) );
		sx = scale_x;
		sy = scale_y;
		file_text_write_string(game.log_file,"Load Window: UI scale x<"+string(scale_x)+"> y<"+string(scale_y)+">\n")
	}
	x_scale_savewindow = sx;
	y_scale_savewindow = sy;
	} break;
	
//---MAIN GAME RMS
	case rm_menu_design: {
	//place buttons (menu,exitgame) at top
	var x_offset = CELL_SIZE; //make space for side border...
	var _x = 0;
	var _y = 0;
	with(obj_exitgame){
		_x += scale*spriteWidth;
		_y = scale*spriteHeight;
		x = ROOM_SIZE_X - (_x+x_offset);
		y = 0;
	}
	with(obj_menugame){
		_x += scale*spriteWidth;
		//_y should be the same here...
		x = ROOM_SIZE_X - (_x+x_offset);
		y = 0;
	}
	//---
	var _buffer_x = x_offset;
	var _buffer_y = _y; //space for buttons at top
	//set-up for options window
	var options_UI_x = (1/3)*ROOM_SIZE_X; //should be in center-ish
	var options_UI_y = _buffer_y;
	with(loadsavesystem){
		UI_x = options_UI_x;
		UI_y = options_UI_y;
		draw_set_font(UI_header_font);
		var _headerWidth = string_width(o_header_text) + 2*x_buffer + 2*CELL_SIZE;
		var maxWidth = max( _headerWidth, (1/3)*ROOM_SIZE_X );
		scale_x = floor( (maxWidth    -2*_buffer_x) / (UI_width -2*CELL_SIZE) );
		scale_y = floor( (ROOM_SIZE_Y -2*_buffer_y) / (UI_height-2*CELL_SIZE) );
		file_text_write_string(game.log_file,"LoadSave: UI scale x<"+string(scale_x)+"> y<"+string(scale_y)+">\n")
		showLoadSave=false; //turn OFF display
		sprite_ind = ind;
		//add text offsets too...
		text_x = UI_x + x_buffer;
		text_y = UI_y + y_buffer + UI_header_textHeight;
		UI_text_maxWidth = scale_x*(UI_width -2*CELL_SIZE) - (2*x_buffer) - CELL_SIZE;	
		UI_text_maxHeight= scale_y*(UI_height-2*CELL_SIZE) - (2*y_buffer) - UI_header_textHeight;
		//---
		UI_text_maxLines = floor(UI_text_maxHeight / UI_font_textHeight);
	}
	//set-up for structures
	with(structuresystem){
		showStructures=true; //turn ON structures drawings
	}
	} break;
}


//---------GAME WORLD STARTS---------//
if(g_curr_state == game_state.main_menu) exit; //don't process below if in menu
//---------Populate game world
//

//---------Camera views
//

