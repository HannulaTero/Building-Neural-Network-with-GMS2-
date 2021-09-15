
/*________________________________________________________________________________________________________________

	Define all available cost function here for neural network.
__________________________________________________________________________________________________________________
*/

// List of all available cost functions.
enum CostFunc {
	MSE,	// Mean Squared Error.
}

#macro	COST_FUNC	global.gCOST_FUNCTION_ARRAY

COST_FUNC = [];
COST_FUNC[CostFunc.MSE]	= neural_cost_mse;


//________________________________________________________________________________________________________________
//
//	MEAN SQUARED ERROR
//________________________________________________________________________________________________________________
/// @func	neural_cost_mse(delta, output, target);
/// @desc	Cost function for calculating error for example, which are given for neural network
/// @desc	Cost is calculated for given delta, which can be backpropagated backward through network.
/// @param	{array}		delta		Structure for layers' neurons part for total error, will be updated here.
/// @param	{array}		output		Network prediction for given input (from example)
/// @param	{array}		target		Target output values for given example (input-output pair)
function neural_cost_mse(delta, predictions, targets) {
	var error = 0;	// Error is always positive.
	var count = array_length(delta);
	for(var i = 0; i < count; i++) {
		var prediction = predictions[i];
		var target = targets[i];
		// Cost function
		error += sqr(prediction - target) * .5;	
		// Derivative of Cost-function. 
		delta[@i] = (prediction - target);
	}
	return error / count;
}




