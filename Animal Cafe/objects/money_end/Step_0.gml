// ----------------------------
//        MOUSE CONFIG
// ----------------------------
var mx      = device_mouse_x_to_gui(0);
var my      = device_mouse_y_to_gui(0);
left_click = mouse_check_button_pressed(mb_left);

// ----------------------------
//        HOVER CONFIG
// ----------------------------
hover = -1;
// Hover Detection
for (var i = 0; i < btn_count; i++){	
	var left = btn_left(i);
	
	if(point_in_rectangle(mx, my, left, btn_y, left + btn_w, btn_y + btn_h)){
		hover = i;
		break;
	}
}	

// Hover Selection
if (hover != -1) {
	selected = hover;
}

// ----------------------------
//        BUTTON ACTIONS
// ----------------------------
if(hover != -1 and hover == selected and left_click){
	switch(selected) {
		case 0:
			if(has_end) {
				show_debug_message("STILL ON GOING WORK");
			} else {
				room_goto(Room1);
			}
			break;
		case 1: 
			show_debug_message("STILL ON GOING WORK");
			break;
		case 2: 
			game_end();
			break;
	}
}

