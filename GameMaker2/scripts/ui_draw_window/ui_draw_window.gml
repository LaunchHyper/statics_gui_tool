/// @function		ui_draw_window	
/// @description	
function ui_draw_window(_ui_x,_ui_y, _ui_scale_x,_ui_scale_y, _sprite_ind){
	var _cs = CELL_SIZE;
	var _sprite_ui_window = spr_ui_window;
	
	//reduce scale since borders is seperate
	_ui_scale_x -= 2;
	_ui_scale_y -= 2;
	
	//window
	var _x = _ui_x + _cs;
	var _y = _ui_y + _cs;
	draw_sprite_part_ext(
		_sprite_ui_window,_sprite_ind,	//image, sub-image
		_cs,_cs,_cs,_cs,				//area
		_x,_y,							//location
		_ui_scale_x,_ui_scale_y,		//scale
	c_white,1);
	//borders
	//---corners
	var _x0=_ui_x,							_y0=_ui_y;
	var _x1=_ui_x+(_ui_scale_x+1)*_cs,		_y1=_y0;
	var _x2=_x0,							_y2=_ui_y+(_ui_scale_y+1)*_cs;
	var _x3=_x1,							_y3=_y2;
	draw_sprite_part(_sprite_ui_window,_sprite_ind,0,		0,		_cs,_cs,_x0,_y0);
	draw_sprite_part(_sprite_ui_window,_sprite_ind,2*_cs,	0,		_cs,_cs,_x1,_y1);
	draw_sprite_part(_sprite_ui_window,_sprite_ind,0,		2*_cs,	_cs,_cs,_x2,_y2);
	draw_sprite_part(_sprite_ui_window,_sprite_ind,2*_cs,	2*_cs,	_cs,_cs,_x3,_y3);
	//---top
	for(var _i=0; _i<_ui_scale_x; _i++){
		var _ix = _ui_x + _cs*(_i+1);
		var _iy = _ui_y;
		draw_sprite_part(_sprite_ui_window,_sprite_ind,_cs,0,_cs,_cs,_ix,_iy);
	}
	//---bottom
	for(var _i=0; _i<_ui_scale_x; _i++){
		var _ix = _ui_x + _cs*(_i+1);
		var _iy = _ui_y + _cs*(_ui_scale_y+1);
		draw_sprite_part(_sprite_ui_window,_sprite_ind,_cs,2*_cs,_cs,_cs,_ix,_iy);
	}
	//---left
	for(var _i=0; _i<_ui_scale_y; _i++){
		var _ix = _ui_x;
		var _iy = _ui_y + _cs*(_i+1);
		draw_sprite_part(_sprite_ui_window,_sprite_ind,0,_cs,_cs,_cs,_ix,_iy);
	}
	//---right
	for(var _i=0; _i<_ui_scale_y; _i++){
		var _ix = _ui_x + _cs*(_ui_scale_x+1);
		var _iy = _ui_y + _cs*(_i+1);
		draw_sprite_part(_sprite_ui_window,_sprite_ind,2*_cs,_cs,_cs,_cs,_ix,_iy);
	}
	
	//return coordinates of inner window
	return [_x,_y];
}