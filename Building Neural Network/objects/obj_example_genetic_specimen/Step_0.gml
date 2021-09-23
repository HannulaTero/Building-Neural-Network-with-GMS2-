/// @desc DECISION-MAKING
if (!alive) exit;

var input = nn.first.output;
var index = 0;
// Input: Wall
for(var i = 0; i < inputWall; i++) {
	input[@index++] = Range(view[i], 256, obj_example_genetic_wall);
}
// Input: Floor
input[@index++] = Range(270, 256, obj_example_genetic_floor);

// THINK - make prediction what should be done
nn.Forward();

// Controlling
button = (nn.last.output[0] > 0); // Ai "press" jump button