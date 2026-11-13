randomize();

is_day = false;
cooling_down = false;
open_tables = noone;
closed_tables = {};

rampup = 0;

CustomerOrder = function() {
	show_debug_message("CAN I GET...");
}

InitializeTables = function() {
	open_tables = struct_get_names(floor_manager.tables);
	show_debug_message("---" + string(open_tables));
	is_day = true;
}

ReturnTable = function(key) {
	delete closed_tables[$ key];
	
	array_push(open_tables, key);
}

CreateTable = function() {
	if (array_length(open_tables) > 0) {
		table_index = irandom(array_length(open_tables) - 1);
		table_id = open_tables[table_index];
	
		closed_tables[$ table_id] = [];
	
		number_of_customers = irandom_range(1, array_length(floor_manager.tables[$ table_id]));
		for (var i = 0; i < number_of_customers; i++) {
			show_debug_message("TABLED");
			customer = instance_create_layer(convertToGrid(obj_entrance.x), convertToGrid(obj_entrance.y - CELLSIZE), "Customers", obj_customer);
			customer.MoveTo(floor_manager.tables[$ table_id][i], CustomerOrder);
			array_push(closed_tables[$ table_id], customer);
		}
		
		array_delete(open_tables, table_index, 1);
		
	} else {
		show_debug_message("No Open Tables");
	}
}