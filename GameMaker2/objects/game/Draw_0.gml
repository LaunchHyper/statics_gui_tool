/// @description DEBUG print
if(!debug) exit;

//---------MOUSE
draw_circle(mouse_x,mouse_y,CELL_SIZE_VS,false)

//---------COLLISION BOX
//

//---------INTERACTION RADIUS
//

//---------CELLSIZE
#region display the grid cells
draw_set_alpha(0.3); //dim the cellgrid

var xx = 0;
var cs = CELL_SIZE;
var r = room_width div cs; //horizontal lines
repeat(r){
	draw_line_color(xx, 0, xx, room_height, c_white,c_white);
	xx += cs;
}

var yy = 0;
r = room_height div cs; //vertical lines
repeat(r){
	draw_line_color(0, yy, room_width, yy, c_white,c_white);
	yy += cs;
}

draw_set_alpha(1);
#endregion
