var bx = x + interactoffset_x + 16;
var by = y + interactoffset_y + 16;
	
// Draw the box.
draw_set_color(c_white);
draw_roundrect(bx - 16, by - 16, bx + 16, by + 16, true);

draw_set_color(c_black);
