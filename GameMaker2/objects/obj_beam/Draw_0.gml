if(width<0 or height<0) exit;

var xscale = width div spriteWidth;
var yscale = height div spriteHeight;

var flag_mouse_over = flag_mouse_over_center || flag_mouse_over_left || flag_mouse_over_right;

var ind=0;
if(flag_mouse_over) ind=1;
draw_sprite_ext(
	sprite, ind, 
	x,y,xscale,yscale, angle_deg,
	c, 1
);
draw_set_font(font);
var t_x = mouse_x + (9 * scale);
var t_y = mouse_y + (4 * scale);
var _c = c_black
draw_text_color(t_x, t_y, text, _c,_c,_c,_c, 1);