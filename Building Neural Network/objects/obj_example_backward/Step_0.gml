/// @desc GRADIENT DESCENT
training = false;
var xx = random(room_width);
var yy = random(room_height);

// Make just a prediction - don't learn
if (keyboard_check(ord("1"))) {
	Example(mouse_x, mouse_y); // Normalize x/y
	nn.Forward(input);
}

// Learn from single example
if (keyboard_check(ord("2"))) {
	training = true;
	Example(xx, yy);	// Generate random example
	nn.Forward(input);	// Make prediction
	nn.Cost(output);	// Evaluate performance, get error-signal
	nn.Backward();		// Backpropagate signal
	nn.Apply(.1);		// Update parameters -> Learn!
}

// Learn from several examples
if (keyboard_check(ord("3"))) {
	training = true;
	Example(xx, yy);		// Generate random example
	nn.Forward(input);		// Make prediction
	nn.Cost(output);		// Evaluate performance, get error-signal
	nn.Backward();			// Backpropagate signal
	if (nn.session > 25) {	// Take average of 25 examples
		nn.Apply(.1);		// Update parameters -> Learn!
	}
}

// If want to use "true" gradient descent, you would go through all data
// And then Apply. This would be repeated until satisfactory results.
// But we don't have data, as we generate examples, so that isn't meaningful.
// Other note that this type of GD is intense as learning happens only when 
// all data has been gone through, and that is repeated many times.
// So optimization is to use minibatches.









