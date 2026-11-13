tether = noone;

Interaction = function(pointer) {
	if (tether != obj_player) {
		tether = pointer;
		tether.holding = id;
	}
}