// ----------------------------
//         GAME CONFIG
// ----------------------------
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();
has_end = (room == ENDROOM);

// ----------------------------
//      MENU COLORS CONFIG
// ----------------------------
col_ui = c_white;
col_bg = make_colour_rgb(25, 25, 30);
col_panel = make_colour_rgb(38, 38, 44);
col_money = make_colour_rgb(0, 128, 0);
col_btn = make_colour_rgb(50, 50, 50); //Change later
col_hover = make_colour_rgb(70, 110, 170);

// ----------------------------
//	   MENU PANEL CONFIG
// ----------------------------
center_x = gui_w / 2;			// Center cord
center_y = gui_h / 2;			// Center cord

panel_w = 620;
panel_h = 400;
panel_x1 = center_x - panel_w / 2;
panel_x2 = center_x + panel_w / 2;
panel_y1 = center_y - panel_h / 2;
panel_y2 = center_y + panel_h / 2;

title_y = panel_y1 + 60;		// Title Position
money_y = panel_y1 + 150;		// Money Position

// ----------------------------
//       BUTTONS CONFIG
// ----------------------------
options = [has_end ? "Options" : "Next Day", "End Day", "Exit Game"];

btn_w = 160;
btn_h = 50;
btn_gap = 20;
btn_count = array_length(options);
btn_total_width = btn_count * btn_w + (btn_count - 1) * btn_gap;
btn_y = panel_y2 - btn_h - 40;
btn_x = center_x - btn_total_width / 2;
selected = 0;
hover = -1;

btn_left = function(i) {
	return btn_x + i * (btn_w + btn_gap);
};

