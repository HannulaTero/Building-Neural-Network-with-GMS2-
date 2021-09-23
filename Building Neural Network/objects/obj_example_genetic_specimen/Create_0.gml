/// @desc SPECIMEN CONSTRUCTOR

// Where to look at for walls. (ray-directions)
view = [0, -5,5, -10,10, -20,20, -45,45, -90,90]; 

// Determine input count
inputWall = array_length(view);	// For wall-detection
inputFloor = 1;					// For floor-detection

// Create network
nn = new neural_network();
nn.add.Input(inputWall + inputFloor);
nn.add.Dense(8, ActFunc.TANH);
nn.add.Dense(1, ActFunc.TANH);

// Specimen variables
image_blend = make_color_hsv(irandom(255), 192, 192);
button	= 0;		// Pressing jump-button
vspd	= 0;		// Vertical speed
alive	= true;		// 
fitness = 0;		// for Genetic Algorithm

// Restart for next round
Restart = function() {
	fitness = 0; 
	x		= xstart;
	y		= 0;
	vspd	= 0;
	alive	= true;
	vspeed	= 0;	 // Stop Death Animation.
	hspeed	= 0;	 // 
	image_angle = 0; //
}
	
// Finding normalized range 
// Derived from: https://www.gmlscripts.com/script/range_finder
function Range(dir, range, obj) {
    var sx = lengthdir_x(range, dir);
    var sy = lengthdir_y(range, dir);
    var dx = x + sx;
    var dy = y + sy;
	var dist = range; // If doesn't collide, max-range.
	// Check wether collides with anything
    if (collision_line(x, y, dx, dy, obj, true, true) != noone) {
		// Binary search 
		// Until we have pixel accuracy of collision point
        while((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx *= .5;
            sy *= .5;
            if (collision_line(x, y, dx, dy, obj, true, true) == noone) {
                dx += sx;
                dy += sy;
            } else {
                dx -= sx;
                dy -= sy;
            }
        }
		// Calculate distance from collision point
        dist = point_distance(x, y, dx, dy);
    }
	// Return normalized range.
    return dist / range;
}
	
	
