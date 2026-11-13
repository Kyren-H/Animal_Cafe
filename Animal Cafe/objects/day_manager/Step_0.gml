if (is_day) {
	roll = random(100) + rampup;
	
	if (roll < spawn_chance && !cooling_down) {
		CreateTable();
		cooling_down = true;
		alarm[0] = cooldown;
		rampup = 0;
	} else {
		rampup -= 1;
	}
}