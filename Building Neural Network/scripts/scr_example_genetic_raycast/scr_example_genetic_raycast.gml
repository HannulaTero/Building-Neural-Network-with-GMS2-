/// @func	Ray(x, y, dir, range, obj);
/// @desc	Finding normalized range
/// @desc	Derived from: https://www.gmlscripts.com/script/range_finder
function Ray(xx, yy, dir, range, obj) {
    var sx = lengthdir_x(range, dir);
    var sy = lengthdir_y(range, dir);
    var dx = xx + sx;
    var dy = yy + sy;
	var dist = range; // If doesn't collide, max-range.
    if (collision_line(xx, yy, dx, dy, obj, true, true) != noone) {
		// BINARY SEARCH - Until we have pixel accuracy
        while((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx *= .5;
            sy *= .5;
            if (collision_line(xx, yy, dx, dy, obj, true, true) == noone) {
                dx += sx;
                dy += sy;
            } else {
                dx -= sx;
                dy -= sy;
            }
        }
		// Calculate distance from collision point
        dist = point_distance(xx, yy, dx, dy);
    }
	// Return normalized range.
    return dist / range;
}










	