if (started) {
	var bx = x + 16;
	var by = y - 32;
	
	// Draw the box.
	draw_set_color(c_white);
	draw_roundrect(bx - 9, by - 2, bx + 9, by + 2, false);
	
	draw_set_color(c_black);
	draw_roundrect(bx - 8, by - 1, (bx + (9 * currtime/frametime)), by + 1, false);
}