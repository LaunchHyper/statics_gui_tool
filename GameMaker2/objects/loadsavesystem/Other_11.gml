/// @description Update SAVE/LOAD gameview options
//go through all game files to see which is there...
var i=0; repeat(4){
	//check gameview as check
	var sfile = ".\\game"+string(i+1)+"\\gameview.png" // saves to "game_save_id" location
	if(!file_exists(sfile)) {
		array_set(o_text[1][1], i+1, "Empty"); //update SAVE view
		array_set(o_text[1][2], i+1, "Empty"); //update LOAD view
		if(game.debug) file_text_write_string(game.log_file,"No gamefile for game"+string(i+1)+"\n");
	} else {
		array_set(o_text[1][1], i+1, "game"+string(i+1)); //update SAVE view
		array_set(o_text[1][2], i+1, "game"+string(i+1)); //update LOAD view
		if(game.debug) file_text_write_string(game.log_file,"Yes gamefile for game"+string(i+1)+"\n");
	}
	
	i++;
}
