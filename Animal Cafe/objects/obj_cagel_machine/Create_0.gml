timer = noone;

Interaction = function() {
	timer = instance_create_layer(x, y, "Instances", util_timer);
	timer.InitializeTime(120, function(pointer = id) {
		instance_create_layer(x + 32, y, "Instances", obj_cagel);
		pointer.timer = noone;
	});
}