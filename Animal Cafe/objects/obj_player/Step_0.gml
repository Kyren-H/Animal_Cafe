depth = -x - 8;

// Input
var ix = keyboard_check(vk_right) - keyboard_check(vk_left);
var iy = keyboard_check(vk_down) - keyboard_check(vk_up);

// Delta
var dx = 0;
var dy = 0;

if (ix != 0) {
	dx = ix;
	dy = 0;
	interactoffset_x = ix * CELLSIZE;
	interactoffset_y = 0;
} else if (iy != 0) {
	dx = 0;
	dy = iy;
	interactoffset_x = 0;
	interactoffset_y = iy * CELLSIZE;
}

if (!moving) {
	if (dx != 0 || dy != 0) {
		tx = convertToGrid(x) + (dx * CELLSIZE);
		ty = convertToGrid(y) + (dy * CELLSIZE);
		
		var data = tilemap_get_at_pixel(layer_tilemap_get_id("Tile"), tx, ty);
		if ((data & tile_index_mask) == 8) {
			if (floor_manager.furniture.get(tx, ty) == undefined) {
				moving = true;
			}
		}
	}
} else {
	var distance = point_distance(x, y, tx, ty);
	
	if (distance < 1) {
		x = tx;
		y = ty;
		
		moving = false;
	} else {
		x = lerp(x, tx, 0.33);
		y = lerp(y, ty, 0.33);
	}
}