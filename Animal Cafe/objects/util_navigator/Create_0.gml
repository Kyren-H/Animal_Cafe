agent_astar = instance_create_layer(0, 0, "Instances", util_agent_astar_stepper);
path = [];
parent = noone;
callback = noone;
tx = noone;
ty = noone;

Traverse = function(pointer, target, callbk) {
	parent = pointer;
	callback = callbk;
	InitializePathing(pointer, target);
}

InitializePathing = function(pointer, target) {
	path = agent_astar.StartPath(pointer, target, 0.5);
}