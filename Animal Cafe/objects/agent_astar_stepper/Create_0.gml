StartPath = function (pointer, objective, stepspeed) {
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
		
		var data = {
			obj : pointer,
			_x : int64(stepcoords[0]),
			_y : int64(stepcoords[1])
		}
		
		call_later((stepspeed * (i + 1)), time_source_units_seconds, method(data, function() {
			obj.x = convertToGrid(_x);
			obj.y = convertToGrid(_y);
		}));
	}
}

Step = function (pointer, _x, _y) {
	pointer.x = _x;
	pointer.y = _y;
}