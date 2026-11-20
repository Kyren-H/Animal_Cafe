// ----------------------------
//		   BACKGROUND 
// ----------------------------
draw_set_alpha(1);
draw_set_color(col_bg);
draw_rectangle(0, 0, gui_w, gui_h, false);

// ----------------------------
//           PANEL 
// ----------------------------
draw_set_colour(col_panel);
draw_roundrect(panel_x1, panel_y1, panel_x2, panel_y2, false);

// ----------------------------
//			UI TEXT
// ----------------------------
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// ----------------------------
//         TITLE AREA
// ----------------------------
draw_set_font(font_title);
draw_set_colour(col_ui);
draw_text(center_x, title_y, "Animal Cafe");

draw_set_font(font_ui);

var money = instance_exists(strategic_layer_manager) ? strategic_layer_manager.money: 0;
draw_set_colour(col_money);
draw_text_transformed(center_x, money_y, "Money Earned: $" + string(money), 1.5, 1.5, 0);

// ----------------------------
//        BUTTON AREA
// ----------------------------
for(var i = 0; i < btn_count; i++){
	var active = (i == selected) || (i == hover);
	
	// Box Points
	var x1 = btn_left(i);
	var y1 = btn_y;
	var x2 = x1 + btn_w;
	var y2 = y1 + btn_h;
	
	// Draw Boxing For the Box
	draw_set_colour(active ? col_hover : col_btn);
	draw_roundrect(x1, y1, x2, y2, false);
	
	// Drawing The Text 
	draw_set_colour(col_ui);
	draw_text(x1 + btn_w / 2, y1 + btn_h / 2, options[i]);
}

// ----------------------------
//	   RESET DRAW SETTINGS
// ----------------------------
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);
