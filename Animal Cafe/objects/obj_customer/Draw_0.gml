draw_self();

if (order != noone && gots == false) {
	var bx = x + 16;
	var by = y - 32;
	
	// Draw the box.
	draw_set_color(c_white);
	draw_roundrect(bx - 9, by - 9, bx + 9, by + 9, false);
	
	draw_set_color(c_black);
	draw_sprite(object_get_sprite(global.Menu[$ order][$ "Reference"]), 0, bx - 7, by - 9);
}

if (served == true && has_paid == false) {
	var bx = x + 16;
	var by = y - 32;
	
	// Draw the box.
	draw_set_color(c_white);
	draw_roundrect(bx - 9, by - 9, bx + 9, by + 9, false);
	
	draw_set_color(c_black);
	draw_sprite(spr_kaching, 0, bx - 7, by - 9);
}