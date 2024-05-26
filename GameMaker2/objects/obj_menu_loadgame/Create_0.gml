
scale = game.scale
scale_x = 1; //updated in game
scale_y = 1; //updated in game

sprite_button = spr_ui_button;
sprite_window = spr_ui_window;
s_gameimage = -1; //loaded from "game#/gameview.png"

sprite0Width = sprite_get_width(sprite_button);
sprite0Height = sprite_get_height(sprite_button);
sprite1Width = sprite_get_width(sprite_window);
sprite1Height = sprite_get_height(sprite_window);

c0 = c_black;
c1[0] = c0;
c1[1] = c0;
c1[2] = c0;
c1[3] = c0;

text0 = "Load Project";
text1[0] = array_get(loadsavesystem.o_text[1][1],1);
text1[1] = array_get(loadsavesystem.o_text[1][1],2);
text1[2] = array_get(loadsavesystem.o_text[1][1],3);
text1[3] = array_get(loadsavesystem.o_text[1][1],4);

curr_mouse1_index = -1;
prev_mouse1_index = -1;

font = fnt_text_12;

flag_mouse0_over = false;
flag_mouse1_over = false;
flag_mouse0_press = false;
flag_mouse1_press = false;
