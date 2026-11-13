furniture = new CoordinateKeyDictionary();
// NOTE TO SELF PLACEABLE WALLS SHOULD COUNT AS FURNITURE

// data structure -- id of the table object as a (stringified) key, array of chairs as value.
tables = {};

AddFurniture = function(_x, _y, pointer) {
	//show_debug_message("Instantiating " + string(pointer) + " at " + string(convertToGrid(_x)) + ", " + string(convertToGrid(_y)));
	//layer_sprite_create("TESTING", convertToGrid(_x), convertToGrid(_y), spr_TESTDISPLAY);
	furniture.set(_x, _y, pointer);
	if (pointer.object_index == obj_chair or pointer.object_index == obj_table) {
		AssignTable(_x, _y, pointer);
	}
}


AssignTable = function(_x, _y, pointer) {
	_x = convertToGrid(_x);
	_y = convertToGrid(_y);
	
	// 0 is right-facing, 1 is down-facing, 2 is left-facing, 3 is up-facing
	var directions = [
		{xx : CELLSIZE, yy : 0},
		{xx : 0, yy : CELLSIZE},
		{xx : -CELLSIZE, yy : 0},
		{xx : 0, yy : -CELLSIZE},
	];
		
	if (pointer.object_index == obj_chair) {
		var try_other = instance_position(_x + directions[pointer.image_index].xx, _y + directions[pointer.image_index].yy, obj_table);
		if (try_other != noone) {
			if (!struct_exists(tables, string(try_other.id))) {
				tables[$ string(try_other.id)] = [];
			}
			
			if (!array_contains(tables[$ string(try_other.id)], pointer)) {
				array_push(tables[$ string(try_other.id)], pointer);
			}
		}
	} else if (pointer.object_index == obj_table) {
		if (!struct_exists(tables, string(pointer))) {
			tables[$ string(pointer)] = [];
		}
		
		for (var i = 0; i < array_length(directions); i++) {
			var try_other = instance_position(_x + directions[i].xx, _y + directions[i].yy, obj_chair);
			if (try_other != noone) {
				if (!array_contains(tables[$ string(pointer)], try_other)) {
					array_push(tables[$ string(pointer)], try_other.id);
				}
			}
		}
	}
	//show_debug_message("--- Sequence Ended.")
	//show_debug_message(string(tables));
}