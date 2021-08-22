/// @desc GRADIENT DESCENT
training = false;

// Make just prediction - don't learn
if (keyboard_check(ord("1"))) {
	Example(mouse_x/room_width, mouse_y/room_height);
	nn.Forward(input);
}

// Learn by single example
if (keyboard_check(ord("2"))) {
	training = true;
	Example(random(1), random(1));
	nn.Forward(input);
	nn.Cost(output, MeanSquaredError);
	nn.Backward();
	nn.Apply(.1);
}

// Learn from several examples
if (keyboard_check(ord("3"))) {
	training = true;
	Example(random(1), random(1));
	nn.Forward(input);
	nn.Cost(output, MeanSquaredError);
	nn.Backward();
	// Applies gradients after minibatch size of 25, can be defined to any size.
	if (nn.session > 25) {
		nn.Apply(.1);
	}
}

// If want to use "true" gradient descent, you would go through all data
// And then Apply. This would be repeated until satisfactory results.
// But we don't have data, as we generate examples, so that isn't meaningful.
// Other note that this type of GD is intense as learning happens only when 
// all data has been gone through, and that is repeated many times.
// So optimization is to use minibatches.









