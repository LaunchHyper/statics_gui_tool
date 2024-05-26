/// @description Save log file
file_text_close(log_file)
log_file = file_text_open_append(logfile)

//reset alarm
alarm[0]=2*60*room_speed; //save update every 2 minutes...