/// @description Update Cursor Sprite Effects
var _sprite = spr_cursor_normal;
var done=false;
switch(curr_cursor_state){
	case cursor_state.normal: {
		if(cursor_event.normal_click==curr_cursor_event){
			_sprite = spr_cursor_normalclick;
			curr_cursor_state=cursor_state.normal_click;
			curr_cursor_event=cursor_event.none;
		} else {
			done=true;
		}
	} break;
	case cursor_state.normal_click: {
		_sprite = spr_cursor_normalclick;
		curr_cursor_state=cursor_state.normal;
	} break;
}
cursor_sprite=_sprite;

//---------Restart Alarm?
if(!done) alarm[3]=0.1*room_speed; //check back in 100 millisec...