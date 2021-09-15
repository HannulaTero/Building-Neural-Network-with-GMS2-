/// @desc CREATE NETWORK
nn = new neural_taped_network();
nn.add.Input(2);
nn.add.Dense(12, ActFunc.TANH);
nn.add.Dense(9, ActFunc.RELU);
nn.add.Dense(6, ActFunc.SIGMOID);
nn.add.Dense(1, ActFunc.TANH);

// Generate examples on the fly
input = [0, 0];
output = [0];
function Example(xx, yy) {
	// Normalize input values
	xx = xx*2 / room_width - 1;
	yy = yy*2 / room_height - 1;
	
	// Update input values
	input[0] = xx;
	input[1] = yy;
	
	// Generate output
	output[0] = ((xx>0) ^^ (yy>0)) * 2 - 1;
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








