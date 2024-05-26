/// @description Draw all structures
if(!showStructures) exit;

var inst_num = instance_number(par_structure); //get total number
var dgrid = ds_depthgrid;
var dstru = ds_structures;

//resize if new objs added
if( num_structures != inst_num ) {
	ds_grid_resize(dstru, 5, inst_num);
	ds_grid_resize(dgrid, 2, inst_num);
	num_structures = inst_num;
	file_text_write_string(game.log_file,"Structures size = "+string(num_structures)+"\n");
}

//Add instances to the grid, "with" is loop here
var yy = 0; with(par_structure) {
	dgrid[# 0, yy] = id;
	dgrid[# 1, yy] = y;
	yy++
}

//Sort the grid in ascending order
ds_grid_sort(dgrid, 1, true);

#region Loop through the grid and draw all the instances

var inst; yy = 0; repeat(inst_num){
	//pull out an ID
	inst = dgrid[# 0, yy];
	//check if within scan view
	var _x=-1,_y=-1;
	with(inst){
		//location
		_x=x;
		_y=y;
		//info
		dstru[# 0, yy] = x;
		dstru[# 1, yy] = y;
		dstru[# 2, yy] = width;
		dstru[# 3, yy] = height;
		dstru[# 4, yy] = angle_deg;
	}
	if( st_t_x<_x and _x<en_t_x and st_t_y<_y and _y<en_t_y ){
		with(inst){	event_perform(ev_draw, 0); } //draw yourself
	}
	yy++;
}

#endregion
