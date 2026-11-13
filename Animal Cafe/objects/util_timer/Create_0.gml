started = false;
frametime = 0;
currtime = 0;
endaction = noone;
meta = noone;

InitializeTime = function(frames, callback, metadata = noone) {
	frametime = frames;
	started = true;
	endaction = callback;
	meta = metadata;
}