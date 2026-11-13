if (started) {
	currtime += 1;
	
	if (currtime >= frametime) {
		if (is_method(endaction)) {
			if (meta != noone) {
				endaction(meta);
				instance_destroy();
			} else {
				endaction();
				instance_destroy();
			}
		}
	}
}