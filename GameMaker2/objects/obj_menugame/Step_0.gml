/// @description Check mouse movement/clicks

flag_mouse_over = (mouse_x>=x and mouse_x<=(x+scale*spriteWidth) and mouse_y>=y and mouse_y<=(y+scale*spriteHeight));


//------------OPERATIONS
if( flag_mouse_over )
{
	//Check mouse press
	flag_mouse_press = device_mouse_check_button_pressed(0, mb_left)
	if( flag_mouse_press ) {
		var flag=false;
		with(loadsavesystem){ 
			showLoadSave = !showLoadSave; //toggle ON<->OFF
			flag = showLoadSave;
		} 
		flag_menu_on = flag;
	}
	
	//---
	c = c_white;
} else {
	flag_mouse_press=false;
	c = c_black;
}

