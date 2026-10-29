#macro CELLSIZE 32 // Grid cell size in pixels.

function convertToGrid(input_coordinate) {
	return int64(floor(input_coordinate / CELLSIZE) * CELLSIZE); 
}