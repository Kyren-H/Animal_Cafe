show_debug_message(struct_get_names(closed_tables));
show_debug_message(is_day);
if (!is_day && array_length(struct_get_names(closed_tables)) <= 0) {
	alarm[0] = -1;
	alarm[1] = -1;
	alarm[2] = -1;
	strategic_layer_manager.EndDay();
} else {
	alarm[2] = 120;
}