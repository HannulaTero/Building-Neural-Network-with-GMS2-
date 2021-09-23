/// @desc SPECIMEN CONSTRUCTOR

// Determine input size
inputWall = 18;		// Inputs for wall-detection
inputFloor = 5;		// Inputs for floor-detection

// Create network
nn = new neural_network();
nn.add.Input(inputWall + inputFloor);
nn.add.Dense(8, ActFunc.RELU);
nn.add.Dense(6, ActFunc.TANH);
nn.add.Dense(2, ActFunc.TANH);
input	= nn.first.output;	// For convenience
output	= nn.last.output;	// 

// Specimen variables
image_blend = make_color_hsv(irandom(255), 192, 192);
button	= 0;		// Pressing jump-button
hspd	= 0;		// Horizontal speed
vspd	= 0;		// Vertical speed
alive	= true;		// 
fitness = 0;		// 
range	= 256;		// View range
ground	= noone;	// Is touching ground

// Restart for next round
Restart = function() {
	fitness = 0; 
	x		= xstart;
	y		= 0;
	vspd	= 0;
	alive	= true;
	vspeed	= 0;	 // Animating.
	hspeed	= 0;	 // 
	image_angle = 0; //
}
	
// Finding range 
// Derived from: https://www.gmlscripts.com/script/range_finder
function Range(xx, yy, dir, range, obj) {
    var sx = lengthdir_x(range, dir);
    var sy = lengthdir_y(range, dir);
    var dx = xx + sx;
    var dy = yy + sy;
	var dist = range;
    if (collision_line(xx, yy, dx, dy, obj, true, true) != noone) {
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
        dist = point_distance(x, y, dx, dy);
    }
    return dist;
}
	
	
