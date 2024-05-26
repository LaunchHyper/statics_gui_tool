/// @description Load Sprite gameview

if( s_gameimage != -1 ) sprite_delete(s_gameimage);

var sfile = ".\\game"+string(game.g_curr_file)+"\\gameview.png" // saves to "game_save_id" location
if(file_exists(sfile)) {
	s_gameimage = sprite_add(sfile,1,false,false,0,0);
	file_text_write_string(game.log_file,"Sprite loaded: "+sfile+"\n");
} else {
	s_gameimage = -1;
}

