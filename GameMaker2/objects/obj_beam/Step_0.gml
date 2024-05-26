if(width<0 or height<0) exit;

var _width_part = width div 3;
var mx = mouse_x;
var my = mouse_y;

//check mouse location relative to obj_beam
flag_mouse_over_left   = (mx>=(x+0*_width_part) and mx<=(x+1*_width_part) and my>=y and my<=(y+height));
flag_mouse_over_center = (mx>=(x+1*_width_part) and mx<=(x+2*_width_part) and my>=y and my<=(y+height));
flag_mouse_over_right  = (mx>=(x+2*_width_part) and mx<=(x+3*_width_part) and my>=y and my<=(y+height));
//Check mouse press
var flag_mouse_press = device_mouse_check_button_pressed(0, mb_left);

//------------OPERATIONS
if(      flag_stretch and !flag_move and !flag_rot){ 
	text = "Stretch: "+string(width); 
	if( flag_mouse_press ) flag_stretch=false;
}
else if(!flag_stretch and  flag_move and !flag_rot){ 
	text = "Move: "+string(mx)+","+string(my); 
	if( flag_mouse_press ) flag_move=false;
}
else if(!flag_stretch and !flag_move and  flag_rot){ 
	text = "Rotate: "+string(angle_deg); 
	if( flag_mouse_press ) flag_rot=false;
}
else{ 
	//none operations active
	text=""; 
	//move over?
	if(flag_mouse_over_left){ text = "Stretch"; } //left is stretch toggle
	if(flag_mouse_over_center){ text = "Move"; } //center is move toggle
	if(flag_mouse_over_right){ text = "Rotate"; } //right is rotate toggle
	//---
	if( flag_mouse_press )
	{
		if(flag_mouse_over_left){ flag_stretch = true; } //left is stretch toggle
		if(flag_mouse_over_center){ flag_move = true; } //center is move toggle
		if(flag_mouse_over_right){ flag_rot = true; } //right is rotate toggle
	}
}
//---------Transformation ops
if( flag_move )
{
	x = mx;
	y = my;
}
if( flag_rot )
{
	var _inc_deg = 1;
	angle_deg += _inc_deg*sign(x-mx);
	var angle_rad = pi/180*angle_deg
	angle_deg = 180/pi*arctan2(sin(angle_rad),cos(angle_rad)) //angle wrapping
}
if( flag_stretch )
{
	var _inc_w = 1;
	width += _inc_w*sign(x-mx);
	if(width<1) width=1; //limit
}