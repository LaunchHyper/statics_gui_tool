/// @description Pause txt / Fade effects



//---------GAME WORLD STARTS---------//
if(g_curr_state == game_state.main_menu) exit; //don't process below if in menu
//---------Pause txt
if(g_pause_state)
{
	var c = c_white;
	var _x = global.gameWidth div 3	
	var _y = global.gameHeight div 3
	
	draw_set_font(fnt_text_24);
	var _text="";
	if(g_load_alarm)     { _text="LOADING GAME"; }
	else if(g_save_alarm){ _text="SAVING GAME";  }
	else                 { _text="GAME PAUSED";  }
	draw_text_color(_x,_y,_text,c,c,c,c,1);
}
