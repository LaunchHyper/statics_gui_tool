
var ind=0;
if(flag_mouse_over) ind=1;
if(flag_mouse_press) ind=2;
draw_sprite_part_ext(
	sprite, ind, 0,0, spriteWidth,spriteHeight, 
	x,y, scale,scale, c_white, 1
);
if(sprite==spr_ui_button) ind=0;
else ind=1;
draw_set_font(font);
var t_x = x + (9 * scale);
var t_y = y + (4 * scale);
draw_text_color(t_x, t_y, text[ind], c,c,c,c, 1);
