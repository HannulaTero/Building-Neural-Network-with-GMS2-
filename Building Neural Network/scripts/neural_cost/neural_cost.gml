
/*________________________________________________________________________________________________________________

	Define all available cost function here for neural network.
__________________________________________________________________________________________________________________
*/

// List of all available cost functions.
enum CostFunc {
	MSE,	// Mean Squared Error.
}

/// @func	MeanSquaredError(delta, output, target);
/// @desc	Cost function for calculating error for examples, which are given for neural network
/// @desc	Cost is calculated for given delta, which can be backpropagated backward through network.
/// @param	{array}		delta		Structure for layers' neurons part for total error, will be updated here.
/// @param	{array}		output		Network prediction for given input (from example)
/// @param	{array}		target		Target output values for given example (input-output pair)
function MeanSquaredError(delta, predictions, targets) {
	var error = 0;	// Error is always positive.
	var count = array_length(delta);
	for(var i = 0; i < count; i++) {
		var prediction = predictions[i];
		var target = targets[i];
		error += sqr(prediction - target) * .5;	// Squared error: difference between wanted result and actual result. Larger difference is punished more.
		delta[@i] = (prediction - target);		// Neuron's part for total error. Derivative of Cost-function.
	}
	return error / count;
}