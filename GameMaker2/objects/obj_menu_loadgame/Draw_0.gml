
var cs = CELL_SIZE;

//Load button
var ind=0;
if(flag_mouse0_over) ind=1;
if(flag_mouse0_press) ind=2;
draw_sprite_ext(sprite_button,ind,x,y,scale,scale,0,c_white,1);
draw_set_font(font);
var t_x = x + (9 * scale);
var t_y = y + (4 * scale);
draw_text_color(t_x, t_y, text0, c0,c0,c0,c0, 1);

//If clicked on Load button
if( flag_mouse0_press ){
	//Four game{1,2,3,4} views
	var i=0; repeat(4){
		var y_offset = (i+1)*scale*sprite0Height;
		var t_xx = t_x;
		var t_yy = t_y + y_offset;
		
		ind=0;
		if(curr_mouse1_index==i and !flag_mouse1_press) ind=1; //display highlighted button or not...
		else if(curr_mouse1_index==i and flag_mouse1_press) ind=2; //pressed button
		draw_sprite_ext(sprite_button,ind,x,y+y_offset,scale,scale,0,c_white,1);
		draw_set_font(font);
		draw_text_color(t_xx, t_yy, text1[i], c1[i],c1[i],c1[i],c1[i], 1);
		
		i++;
	}
	
	//Display mini-game view of selected game{1,2,3,4} view
	if( s_gameimage!=-1 ){		
		//window
		var _x = x - scale_x*(sprite1Width-2*cs);
		var _y = y + scale*sprite0Height;
		ui_draw_window(_x,_y,scale_x,scale_y,WINDOW_INDEX);
		draw_sprite(s_gameimage,0,_x+cs,_y+cs);
		//header
		_x = x - (scale_x*3/4)*(sprite1Width-2*cs) + (scale/2)*sprite0Width;
		_y = y;
		draw_sprite_ext(spr_ui_window_top,WINDOW_INDEX,_x,_y,scale,scale,0,c_white,1);
		if( curr_mouse1_index!=-1 ) {
			var t_xx = _x + (9 * scale);
			var t_yy = _y + (4 * scale);
			var c = c_black;
			draw_set_font(font);
			draw_text_color(t_xx,t_yy, text1[curr_mouse1_index],c,c,c,c,1);
		}
	}
	
}
