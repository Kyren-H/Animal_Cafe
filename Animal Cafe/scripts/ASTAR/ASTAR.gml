/// --- ATTENTION! ---
/// DO NOT MODIFY THE CONTENTS OF THIS FILE WITHOUT INFORMING ME.

/// @desc Core pathfinding function, lazy graph evaluation a-star algorithm. GRIDIFY INPUTS. 
/// @param start_x Starting X position.
/// @param start_y Starting Y position.
/// @param goal_x Goal X position.
/// @param goal_y Goal Y position.
function aStar(start_x, start_y, goal_x, goal_y) {
	var directions = [
		{xx : CELLSIZE, yy : 0},
		{xx : 0, yy : CELLSIZE},
		{xx : -CELLSIZE, yy : 0},
		{xx : 0, yy : -CELLSIZE},
	];
	
	// A* fundamentals; open is the list of available cells to search, closed is already searched cells.
	// Lookup is a utility since ds_priority structs don't support searching.
	var open = ds_priority_create();
	var lookup = {};
	var closed = {};
	
	// Initialization of the starting node.
	var starting_node = new AStarNode([start_x, start_y], noone, AStarNode.heuristic_helper(start_x, goal_x, start_y, goal_y), 0);
	ds_priority_add(open, starting_node, starting_node.node.F); // Note -- ds_priority's third parameter is a priority. F is used because A* searches minimum F nodes.
	var strkey = string(starting_node.node.Coordinates[0]) + "_" + string(starting_node.node.Coordinates[1]);
	lookup[$ strkey] = starting_node;
	
	// A* will continue searching until it runs out of options or finds the goal.
	while (ds_priority_size(open) > 0) {
		// Cache current cell (node with minimum F), remove it from the open lists, and add it to the closed list.
		var current = ds_priority_find_min(open);
		ds_priority_delete_min(open);
		strkey = string(current.node.Coordinates[0]) + "_" + string(current.node.Coordinates[1]);
		variable_struct_remove(lookup, strkey);
		closed[$ strkey] = current;
		
		// This particular algorithm only searches the cells above, below, to the right, and to the left.
		for (var i = 0; i <= 3; i++) {
			// Assemble children nodes (next steps). Newcoords and Newheur are only present because the code is too long for a single line.
			var newcoords = [current.node.Coordinates[0] + directions[i].xx, current.node.Coordinates[1] + directions[i].yy];
			var newheur = AStarNode.heuristic_helper(newcoords[0], goal_x, newcoords[1], goal_y);
			var newnode = new AStarNode([newcoords[0], newcoords[1]], current, newheur, current.node.PathCost + 32);
			
			// If this child node is the goal, cease search and trace the path backwards.
			if (newnode.node.Coordinates[0] == goal_x and newnode.node.Coordinates[1] == goal_y) {
				ds_priority_destroy(open);
				return Trace(newnode);
			} else {
				// Checks; if this node is already in the open list but doesn't have a more optimistic F, do not add it.
				strkey = string(newnode.Coordinates[0]) + "_" + string(newnode.Coordinates[1]);
				var possible_dupes = [lookup[$ strkey], closed[$ strkey]]
				if (possible_dupes[0] != undefined and possible_dupes[0].node.F < newnode.node.F) {
					continue;
				// If this node is already in the closed list and doesn't have a more optimistic F this tiem, do not add it.
				} else if (possible_dupes[1] != undefined and possible_dupes[1].node.F < newnode.node.F) {
					continue;
				} else {
					// Otherwise, so long as it is valid, add it.
					if (!IsBlocked(newnode.node.Coordinates[0], newnode.node.Coordinates[1]) and IsValid(newnode.node.Coordinates[0], newnode.node.Coordinates[1])) {
						ds_priority_add(open, newnode, newnode.node.F);
					} else {
						continue;
					}
				}
			}
		}
	}
	// If we reach this point, the objective was unreachable.
	ds_priority_destroy(open);
	return undefined;
}

/// @desc Node struct for the A* pathfinding function.
/// @param coords The coordinates of the node.
/// @param parentnode Pointer for the node this one was discovered from.
/// @param heuristic Estimation of remaining distance to the goal, basically.
/// @param pathcost The cost of traveling to this node.
function AStarNode(coords, parentnode, heuristic, pathcost) constructor {
	node = {
		"Coordinates":coords,
		"Parent":parentnode,
		"Heuristic":heuristic,
		"PathCost":pathcost,
		// F = the total pathing cost moving through a node. Smaller is better.
		"F":(heuristic + pathcost)
	};
	
	// Shorthand heuristic calculator. I've copy-pasted more stringify code than I've used this, so... efficiency.
	static heuristic_helper = function (current_x, goal_x, current_y, goal_y) {
		return abs(current_x - goal_x) + abs(current_y - goal_y);
	} 
}

/// @desc Compares coordinates against the coordinates known to be occupied by blocking furniture. Returns true if the coordinates are blocked.
/// @param _x X-coordinate to look at.
/// @param _y Y-coordinate to look at.
function IsBlocked(_x, _y) {
	return floor_manager.furniture.get(_x, _y) != undefined;
} 

/// @desc Compares coordinates against the tilemap. Returns true if the coordinates are a valid walkable tile.
/// @param _x X-coordinate to look at.
/// @param _y Y-coordinate to look at.
function IsValid(_x, _y) {
	var tilemap = layer_tilemap_get_id("Tile");
	
	var data = tilemap_get_at_pixel(tilemap, _x, _y);
	// 9 is the only proper floor tile in the present tileset. Can alter this to a list check if we add more floors.
	return ((data & tile_index_mask) == 9);
}

/// @desc AStar result function; traces a walkable path from the goal back to the start, reverses the order, and returns a walkable path.
/// @param The goal node. 
function Trace(astarnode) {
	var path = [];
	// Only adds coordinates to Path since AStarNode structs are heavier than strings in a list. That and we don't need more than the coordinates.
	while (astarnode != noone) {
		array_push(path, string(astarnode.node.Coordinates[0]) + "_" + string(astarnode.node.Coordinates[1]));
		astarnode = astarnode.node.Parent;
	}
	array_reverse(path);
	return path;
}