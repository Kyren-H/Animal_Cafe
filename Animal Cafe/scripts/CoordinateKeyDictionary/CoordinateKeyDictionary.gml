/// @desc Dictionary object that allows for x, y keying.
function CoordinateKeyDictionary() constructor {
	contents = {};
	
	/// @desc Set a value in the dictionary.
	static set = function (_x, _y, value) {
		var key = keyify(_x, _y);
		contents[$ key] = value;
	}
	
	/// @desc Get a value in the dictionary.
	static get = function (_x, _y) {
		try {
			var key = keyify(_x, _y);
			return contents[$ key];
		} catch (exception) {
			show_debug_message("No such object.");
		}
	}
	
	/// @desc Remove a value in the dictionary.
	static remove = function (_x, _y) {
		var key = keyify(_x, _y);
		if (struct_exists(contents, key)) {
			struct_remove(contents, key);
		} else {
			show_debug_message("No such object.");
		}
	}
	
	static keyify = function (_x, _y) {
		return string(convertToGrid(_x)) + "_" + string(convertToGrid(_y));
	}
}