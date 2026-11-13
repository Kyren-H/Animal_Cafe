StartPath = function (pointer, objective, stepspeed) {
	var steps = [];
	
	var start_x = convertToGrid(pointer.bbox_left);
	var start_y = convertToGrid(pointer.bbox_bottom - 1);
	
	var goal_x = convertToGrid(objective.bbox_left);
	var goal_y = convertToGrid(objective.bbox_bottom - 1);
	
	var path = aStar(start_x, start_y, goal_x, goal_y);
	
	if (path == undefined) {
		show_debug_message("AAAAAAAAAAAAHHHHH!");
	}

	for (var i = 0; i < array_length(path); i++) {
		var stepcoords = string_split(path[i], "_");
		array_push(steps, stepcoords);
	}
	
	return steps;
}