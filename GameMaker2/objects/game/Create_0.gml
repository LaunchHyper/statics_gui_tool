randomize();
depth = -2; //on top of everything
cursor_sprite = spr_cursor_normal;
window_set_cursor(cr_none); //remove default cursor

//---cursor
enum cursor_event {
	none,
	normal_click,
}
curr_cursor_event = cursor_event.none;
enum cursor_state {
	normal,
	normal_click,
}
curr_cursor_state = cursor_state.normal;

//---other
debug = false;
font_debug = fnt_smalldigits;

logfile = working_directory + ".\\game0\\log_game.txt" // saves to "game_save_id" location
log_file = file_text_open_write(logfile)
file_text_write_string(log_file,"Created game log at : "+logfile+"\n")
alarm[0]=1;
exception_unhandled_handler(function(ex)
{
    // Show the error message (for debug purposes only)
    file_text_write_string(game.log_file, "--------------------------------------------------------------\n");
    file_text_write_string(game.log_file, "Unhandled exception " + string(ex) + "\n" );
    file_text_write_string(game.log_file, "--------------------------------------------------------------\n");
	//---
	file_text_close(game.log_file);
    return 0;
});

processor_count = 16; //for parallelization... can be updated

//---------GAME SETTINGS
#macro PROB_MAX 100
#macro PROB_MIN 0

enum dir {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}
enum spec_number {
	esc = -1,
	normal = 0,
}
enum game_file {
	newgame = 0,
	file1 = 1,
	file2 = 2,
	file3 = 3,
	file4 = 4,
}
enum game_state {
	//---MENU
	main_menu,
	
	//---GAMEPLAY
	statics_viewer,		//overview of current project
}

global.gameWidth = 750;
global.gameHeight = 420;
display_set_gui_size(global.gameWidth, global.gameHeight);
scale=2; //for button scaling, will be updated
x_scale_savewindow = 1; //for display large save screen, will be updated
y_scale_savewindow = 1; //for display large save screen, will be updated

#macro WINDOW_INDEX 0
ui_window_ind = WINDOW_INDEX; //default sprite to load (i.e. game start or menu)

#region Options settings
//What game folder to load/save
g_curr_file = game_file.newgame;

g_curr_state = game_state.main_menu; //start menu view
g_save_state = g_curr_state; //used to hold previous/other state when needed
g_pause_state = false;		//in pause or not

//---NEW GAME
g_newgame = false; //new game (from menu)...
flag_firstrun = false; //alarm for newgame
g_newgame_state=0;
//---LOAD
g_load = false;		//load all game files
g_load_alarm=false;
g_load_state=0;
//---SAVE
g_save = false;		//save all game files
g_save_alarm=false;
g_save_state=0;

g_pause = false;	//pause game play
g_exit = false;		//exit game... then delete game0 tmp contents
#endregion

#region Key settings
//Movement player + options naviation
left_key = vk_left;
right_key = vk_right;
up_key = vk_up;
down_key = vk_down;

//Special
interact_key = vk_enter;
view_key = ord("V");
camera_interact_key = ord("C");

debug_key = ord("0");
#endregion

//---------Keep track of various items

//---------GAME GRID SIZE
//cell size - assumed square
#macro CELL_SIZE 16
#macro CELL_SIZE_S 8
#macro CELL_SIZE_VS 4
//default room sizes, loading is different
#macro ROOM_SIZE_X 800
#macro ROOM_SIZE_Y 600
#macro ROOM_SIZE_LOADING 400

//default button sizes
#macro BUTTON_X_SIZE (8*CELL_SIZE)
#macro BUTTON_Y_SIZE (2*CELL_SIZE)
#macro BUTTON_SMALL_SIZE (2*CELL_SIZE)
