var interact_target = instance_position(x + interactoffset_x, y + interactoffset_y, obj_customer);
if (interact_target != noone) {
	if (holding != noone) {
		interact_target.Interaction(holding);
		if (holding.tether != id) {
			holding = noone;
		}
	} else {
		interact_target.Interaction();
	}
} else {
	interact_target = instance_position(x + interactoffset_x, y + interactoffset_y, type_food);
	if (interact_target != noone) {
		interact_target.Interaction(id);
		holding = interact_target.id;
	} else {
		interact_target = instance_position(x + interactoffset_x, y + interactoffset_y, type_furniture);
		if (interact_target != noone) {
			var interact_type = interact_target.object_index;
			if (interact_type == obj_cagel_machine || interact_type == obj_koissant_machine) {
				interact_target.Interaction();
			}
		}
	}
}