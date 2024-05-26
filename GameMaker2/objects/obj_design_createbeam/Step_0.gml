/// @description Check mouse movement/clicks

flag_mouse_over = (mouse_x>=x and mouse_x<=(x+scale*spriteWidth) and mouse_y>=y and mouse_y<=(y+scale*spriteHeight));

//------------OPERATIONS
if( flag_mouse_over )
{
	//Check mouse press
	flag_mouse_press = device_mouse_check_button_pressed(0, mb_left);
	if( flag_mouse_press ) 
		with(structuresystem){ 
			buildStructure=true; 
			createBeam=true; 
		} 
	
	//---
	c = c_white;
} else {
	flag_mouse_press = false;
	c = c_black;
}
if(flag_switch_view){
	if(sprite==spr_ui_button){ sprite=spr_ui_button_small; x+=3*spriteHeight; }
	else { sprite=spr_ui_button; x-=3*spriteHeight; }
	spriteWidth = sprite_get_width(sprite);
	spriteHeight = sprite_get_height(sprite);
	//---
	flag_switch_view=false;
}

