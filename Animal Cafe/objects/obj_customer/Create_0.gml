navigator = noone;
served = false;

MoveTo = function(target, callback) {
	show_debug_message("MOVING");
	navigator = instance_create_layer(0, 0, "Instances", util_navigator);
	navigator.Traverse(id, target, callback);
}