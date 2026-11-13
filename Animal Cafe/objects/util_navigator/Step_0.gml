if (tx == noone && ty == noone && array_length(path) > 0) {
	tx = path[0][0];
	ty = path[0][1];
	array_delete(path, 0, 1);
}

var distance = point_distance(parent.x, parent.y, tx, ty);

if (distance < 1) {
	parent.x = tx;
	parent.y = ty;
	
	if (array_length(path) > 0) {
		tx = path[0][0];
		ty = path[0][1];
		array_delete(path, 0, 1);
	} else {
		if (is_method(callback)) {
			callback(parent);
		}
		instance_destroy();
	}
} else {
	parent.x = lerp(parent.x, tx, 0.33);
	parent.y = lerp(parent.y, ty, 0.33);
}