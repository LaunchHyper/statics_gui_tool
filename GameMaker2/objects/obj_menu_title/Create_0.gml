
c = c_black;
font = fnt_text_24;
text = "Statics Viewer";

x_buffer = CELL_SIZE/2;
y_buffer = CELL_SIZE;

sprite = spr_ui_window;

UI_width = sprite_get_width(sprite);
UI_height = sprite_get_height(sprite);

draw_set_font(font);
var text_width = string_width(text);
var text_height = string_height(text);
scale_x = floor( (text_width +2*x_buffer) / (UI_width -2*CELL_SIZE) );
scale_y = floor( (text_height+2*y_buffer) / (UI_height-2*CELL_SIZE) );
file_text_write_string(game.log_file,"Title: scale=<"+string(scale_x)+","+string(scale_y)+">\n");

alpha = 1;
