show_debug_message(struct_get_names(closed_tables));
show_debug_message(is_day);
if (!is_day && array_length(struct_get_names(closed_tables)) <= 0) {
	alarm[2] = -1;
	room_goto(ENDROOM)
}

alarm[2] = 120;