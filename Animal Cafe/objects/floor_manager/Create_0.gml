furniture = new CoordinateKeyDictionary();
// NOTE TO SELF PLACEABLE WALLS SHOULD COUNT AS FURNITURE

AddFurniture = function(_x, _y, pointer) {
	show_debug_message("Instantiating " + string(pointer) + " at " + string(convertToGrid(_x)) + ", " + string(convertToGrid(_y)));
	layer_sprite_create("TESTING", convertToGrid(_x), convertToGrid(_y), spr_TESTDISPLAY);
	furniture.set(_x, _y, pointer);
}