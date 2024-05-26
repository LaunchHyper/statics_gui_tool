/// @description Load Sprite gameview
if( o_gameimage != -1 ) sprite_delete(o_gameimage);

var sfile = ".\\"+string(o_game_file)+"\\gameview.png" // saves to "game_save_id" location
if(file_exists(sfile)) {
	o_gameimage = sprite_add(sfile,1,false,false,0,0);
	if(game.debug) file_text_write_string(game.log_file,"Sprite LOAD/SAVE loaded: "+sfile+"\n");
} else {
	o_gameimage = -1;
	file_text_write_string(game.log_file,"No Sprite LOAD/SAVE: "+sfile+"\n");
}

