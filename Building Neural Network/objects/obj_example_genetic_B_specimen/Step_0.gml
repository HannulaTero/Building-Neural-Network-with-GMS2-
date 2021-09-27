/// @desc DECISION-MAKING

// INPUT - Cast rays
var input = nn.first.output;
var index = 0;
// Detecting walls
for(var i = 0; i < inputWall; i++) {
	var dir = 360 * i/inputWall;
	input[@index++] = Ray(x, y, dir, 256, obj_example_genetic_B_wall);
}
// Detecting floor
for(var i = 0; i < inputFloor; i++) {
	var dir = 210 + 140 * i/inputFloor;
	input[@index++] = Ray(x, y-32, dir, 256, obj_example_genetic_floor);
}

// THINK - Make prediction what should be done
nn.Forward();

// CONTROL - Press jump button
var output = nn.last.output;
button = (output[0] > 0); // Threshold activation.
x += output[1] * 10;