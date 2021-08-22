/// @desc Create network
nn = new neural_gradients();	// Creates network with gradient-structure
nn.add.Input(2);
nn.add.Dense(10, ActFunc.TANH);
nn.add.Dense(6, ActFunc.TANH);
nn.add.Dense(1, ActFunc.TANH);

// Generate examples on the fly
input = [0,0];
output = [0];
function Example(xx, yy) {
	input[0] = xx * 4 - 2;
	input[1] = yy * 4 - 2;
	// Output is Xor-function, range -1 to +1
	output[0] = ((input[0] > 0) ^^ (input[1] > 0)) * 2 - 1;
}

// For drawing examples
training = false;	// Just for drawing.
function DrawArray(array, xx, yy, scale, xspacing, yspacing) {
	var count = array_length(array);
	xx -= xspacing/2;
	yy -= yspacing * count/2;
	for(var i = 0; i < count; i++) {
		var color = neuron_color(array[i]);
		draw_sprite_ext(spr_rectangle, 0, xx, yy, scale, scale, 0, c_white, 1);
		draw_sprite_ext(spr_rectangle, 1, xx, yy, scale, scale, 0, color, 1);
		yy += yspacing;
	}
}








