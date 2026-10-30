var _y = bbox_top + px_overlap;
var _x = bbox_left;

var coverage = [];

var width = bbox_right - bbox_left;
var height = (bbox_bottom - bbox_top) - px_overlap;

for (var py = 0; py < height; py += 32) {
	for (var px = 0; px < width; px += 32) {
		array_push(coverage, [_x + px, _y + py]);
	}
}

for (var i = 0; i < array_length(coverage); i++) {
	floor_manager.AddFurniture(coverage[i][0], coverage[i][1], id);
}