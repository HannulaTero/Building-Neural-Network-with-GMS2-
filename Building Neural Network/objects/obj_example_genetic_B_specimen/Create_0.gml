/// @desc SPECIMEN CONSTRUCTOR

// Determine input size
inputWall = 12;	// For wall-detection
inputFloor = 5;	// For floor-detection

// Create network
nn = new neural_network();
nn.add.Input(inputWall + inputFloor);
nn.add.Dense(8, ActFunc.TANH);	// Add bit more complexity
nn.add.Dense(2, ActFunc.TANH);	// Move + jump.

// Specimen variables
image_blend = make_color_hsv(irandom(255), 192, 192);
vspd	= 0;	// Vertical speed
button	= 0;	// Pressing jump-button
fitness = 0;	// for Genetic Algorithm

// Restart for next round
Restart = function() {
	x		= xstart;
	y		= ystart;
	vspd	= 0;
	fitness = 0; 
}
	


