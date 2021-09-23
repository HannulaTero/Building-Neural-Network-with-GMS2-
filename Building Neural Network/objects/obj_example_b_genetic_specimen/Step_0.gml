/// @desc DECISION-MAKING
if (!alive) exit;

// Set inputs
var index = 0;
for(var i = 0; i < inputWall; i++) {
	var dir = 360 * i/inputWall;
	input[@index++] = Range(x, y-8, dir, range, obj_example_b_genetic_wall) / range;
}
for(var i = 0; i < inputFloor; i++) {
	var dir = 210 + 140 * i/inputFloor;
	input[@index++] = 1-2*Range(x, y-32, dir, range, obj_example_b_genetic_floor) / range;
}

// Think - make prediction what should be done
nn.Forward();

// Controlling
x += 8 * output[0];			// Move left/right
button = (output[1] > 0);	// Ai "press" jump button