/// @description Operate on structures

//---------save/load
if(loadStructures){
	event_perform(ev_other, ev_user1); //load structures
	loadStructures=false;
}
if(saveStructures){
	event_perform(ev_other, ev_user2); //save structures
	saveStructures=false;
}

//---------check keys
var view_key = keyboard_check_pressed(game.view_key);

if(view_key){
	with(obj_design_createbeam){ flag_switch_view=true; }
}

//---------creation of structures
if(buildStructure){
	var inst_layer = "Instances_Structures",
	var flag_mouse_press = device_mouse_check_button_pressed(0, mb_left);
	var mx = mouse_x;
	var my = mouse_y;
	//now check what structure to create..
	if(createBeam){
		if(flag_mouse_press){
			var inst = instance_create_layer(mx,my,inst_layer,obj_beam);
			with(inst){
				width = 100;
				height = 30;
				angle_deg = 0;
			}
			createBeam=false;
			file_text_write_string(game.log_file,"Created beam = "+string(inst)+"("+string(mx)+","+string(my)+")\n");
		}
	} else {
		//all done so can exit checks..
		buildStructure=false;
	}
}