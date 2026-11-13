tether = noone;

Interaction = function(pointer) {
	if (pointer.holding != noone) {
		var otherfood = pointer.holding;
		otherfood.tether = noone;
		pointer.holding = noone;
		otherfood.x = convertToGrid(otherfood.x);
		otherfood.y = convertToGrid(otherfood.y);
	}
	tether = pointer;
	pointer.holding = id;
}