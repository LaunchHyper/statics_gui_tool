if(!showLoadSave) exit;

//---------Background
ui_draw_window(UI_x,UI_y,scale_x,scale_y,sprite_ind);

//---------Header
var c = text_c;
draw_set_font(UI_header_font);
var info_x = UI_x + x_buffer; 
var info_y = UI_y + y_buffer;
draw_text_color( info_x, info_y, o_header_text, c,c,c,c, 1);

//---------Front Options view
if(!loadedOptions) exit;
	
//display page info
c = text_c;	
var i = 0, y_add = 0, tsize = o_text_array_len;
if(o_page==1) y_add += UI_font_textHeight; //shift down page1 start text
repeat(tsize){
	//draw current selection arrow
	if     (o_choice0 == i && o_page==0){ c = choice_c; draw_text_color(UI_x+UI_text_maxWidth, text_y+y_add, "-", c,c,c,c, 1); }
	else if(o_choice1 == i && o_page==1){ c = choice_c; draw_text_color(UI_x+UI_text_maxWidth, text_y+y_add, "-", c,c,c,c, 1); }
	else { c = text_c; }
	//draw display text
	draw_set_font(UI_font)
	draw_text_ext_color(text_x,text_y+y_add, o_text_array[i], UI_font_textHeight,UI_text_maxWidth, c,c,c,c, 1);
			
	y_add += UI_font_textHeight;
	i++;
}	
//display page1 additional contents
if(o_page==1){
	//title as page0 selection
	var text = o_text[0][o_choice0];
	var _x = text_x;
	var _y = text_y;
	c = c_black;
	draw_set_font(UI_font)
	draw_text_ext_color(_x,_y, text, UI_font_textHeight,UI_text_maxWidth, c,c,c,c, 1);
		
	//minigame view
	if(-1!=o_gameimage) draw_sprite_ext(o_gameimage,0,text_x+80,text_y+UI_font_textHeight, 0.5,0.5, 0,c_white,1);
}


