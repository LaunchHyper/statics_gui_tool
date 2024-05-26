/// @function		ui_draw_window_top	
/// @description	
function ui_draw_window_top(UI_x,UI_y, UI_scale, sprite_ind){
	var cs = CELL_SIZE;
	var sprite_UI_window_top = spr_ui_window_top;
	
	//left center
	var _xl=UI_x, _yl=UI_y;
	draw_sprite_part(sprite_UI_window_top,sprite_ind,0,0,cs,cs,_xl,_yl);
	//center
	var _xc=UI_x+cs, _yc=UI_y;
	for(var i=0; i<UI_scale; i++){
		var ix = _xc + cs*i;
		var iy = _yc;
		draw_sprite_part(sprite_UI_window_top,sprite_ind,cs,0,cs,cs,ix,iy);
	}
	//right center
	var _xr=UI_x+2*cs, _yr=UI_y;
	draw_sprite_part(sprite_UI_window_top,sprite_ind,2*cs,0,cs,cs,_xr,_yr);
	
	//return coordinates of inner window
	return [_xc,_yc];
}