depth = -1; //on top of lighting
#region NOTE: these should be modified in game obj
scale = game.scale;
loadStructures = false;
saveStructures = false;
showStructures = false;
#endregion
#region NOTE: these should be modified in create buttons
buildStructure = false;
createBeam = false;
#endregion

//---------Info about all structures
num_structures = 1;
//[x,y,width,height,angle_deg]
ds_structures = ds_grid_create(5,num_structures)

//---------Drawing helper
// set scan location
st_t_x = CELL_SIZE; //start and stop points for drawing
st_t_y = CELL_SIZE; //...should be changed in game or playcanvas
en_t_x = ROOM_SIZE_X - CELL_SIZE;
en_t_y = ROOM_SIZE_Y - CELL_SIZE;

// [id, y_location == used for depth]
// things with larger "y", towards bottom, are on top
ds_depthgrid = ds_grid_create(2, num_structures); 


