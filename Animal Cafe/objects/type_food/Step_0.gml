if (tether == noone) {
	depth = -bbox_bottom;
} else if (tether != noone) {
	depth = -bbox_bottom - 32;
	x = tether.x;
	y = tether.y + 16;
}