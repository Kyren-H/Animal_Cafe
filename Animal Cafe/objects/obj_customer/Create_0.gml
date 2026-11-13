navigator = noone;
timer = noone;
order = noone;
gots = false;
served = false;
has_paid = false;

MoveTo = function(target, callback) {
	//show_debug_message("MOVING");
	navigator = instance_create_layer(0, 0, "Instances", util_navigator);
	navigator.Traverse(id, target, callback);
}

Interaction = function(object = noone) {
	if (gots == false && object != noone) {
		if (object.object_index == global.Menu[$ order][$ "Reference"]) {
			object.tether = id;
			gots = true;
			timer = instance_create_layer(x, y, "Instances", util_timer);
			timer.InitializeTime(180, function(pointer = id, held = object) {
				pointer.served = true;
				pointer.timer = noone;
				instance_destroy(held);
			})
		}
	} else if (served == true && has_paid == false) {
		strategic_layer_manager.money += global.Menu[$ order][$ "Price"];
		has_paid = true;
	}
}