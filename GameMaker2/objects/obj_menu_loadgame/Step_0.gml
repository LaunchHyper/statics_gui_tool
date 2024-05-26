/// @description Check mouse movement/clicks

var x0_offset = sprite0Width*scale;
var y0_offset = sprite0Height*scale;

var yy = y+y0_offset;

flag_mouse0_over = (mouse_x>=x and mouse_x<=(x+x0_offset) and mouse_y>=y and mouse_y<=(y+y0_offset));
flag_mouse1_over = (mouse_x>=x and mouse_x<=(x+x0_offset) and mouse_y>=y and mouse_y<=(yy+4*y0_offset));

//------------OPERATIONS

//Check mouse press over sprite1 area
if( flag_mouse1_over and flag_mouse0_press )
{
	var _game_file = game_file.newgame;
	c1[0]=c_black; 
	c1[1]=c_black;
	c1[2]=c_black; 
	c1[3]=c_black;
	//---top 1/4th	
	if(mouse_y <= (yy+y0_offset)) {
		_game_file = game_file.file1;
		curr_mouse1_index = 0;
	}
	//---1/4th to 2/4th
	else if(mouse_y <= (yy+2*y0_offset)) {
		_game_file = game_file.file2;
		curr_mouse1_index = 1;
	}
	//---2/4th to 3/4th
	else if(mouse_y <= (yy+3*y0_offset)) {
		_game_file = game_file.file3;
		curr_mouse1_index = 2;
	}
	//---bottom 1/4th
	else {
		_game_file = game_file.file4;
		curr_mouse1_index = 3;
	}
	c1[curr_mouse1_index] = c_white;
	//mouse press check
	if( device_mouse_check_button_pressed(0, mb_left) ) flag_mouse1_press = true;
	else												flag_mouse1_press = false;		
	if( flag_mouse1_press and -1!=s_gameimage ){
		with(game){ 
			g_curr_state=game_state.statics_viewer;
			g_curr_file=_game_file; //make sure loading correct file
			g_load=true; 
		}	
	}
	//---update load image
	if( curr_mouse1_index != prev_mouse1_index ){ 
		game.g_curr_file = _game_file;
		event_perform(ev_other, ev_user1); 
	}
	prev_mouse1_index = curr_mouse1_index;
	//---
	
} else {
	flag_mouse0_press=false;
	c1[0]=c_black; 
	c1[1]=c_black;
	c1[2]=c_black; 
	c1[3]=c_black;
}

//Check mouse press over sprite0 area
if( flag_mouse0_over and !flag_mouse0_press )
{
	if( device_mouse_check_button_pressed(0, mb_left) ) flag_mouse0_press = true;
	c0 = c_white;
} else {
	c0 = c_black;
}

