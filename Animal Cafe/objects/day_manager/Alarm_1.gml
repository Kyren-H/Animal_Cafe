var cltables = struct_get_names(closed_tables)
if (array_length(cltables) > 0) {
	for (var i = 0; i < array_length(cltables); i++) {
		
		var checkingtable = closed_tables[$ cltables[i]];
		var allserved = true;
		for (var o = 0; o < array_length(checkingtable); o++) {
			allserved = allserved && checkingtable[o].has_paid;
		}
		
		if (allserved) {
			for (var o = 0; o < array_length(checkingtable); o++) {
				checkingtable[o].MoveTo(obj_entrance, CustomerExit);
			}
			ReturnTable(cltables[i]);
		}
	}
}

alarm[1] = 60;