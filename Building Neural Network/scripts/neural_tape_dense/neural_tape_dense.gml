

/// @func	neural_tape_dense(input, size, activation);
/// @desc	Creates dense-layer with gradients-structure.
/// @param	{layer}	input		Neural network layer
/// @param	{int}	size		Count of neurons
/// @param	{enum}	activation	Enum identifier for activation function.
function neural_tape_dense(_input, _size, _activation) : neural_layer_dense(_input, _size, _activation) constructor {
	// Create gradients-structure
	session = 0;						// {int}		How many passes has been made, for calculating averages
	delta = array_create(size, 0);		// {array}		Neuron's part for total error
	deltaSum = array_create(size, 0);	// {array}		Cumulative delta. Used for calculating average delta from several examples.
	gradients = array_create(size);		// {array2D}	Cumulative gradients. Weight's part for total error.
	for(var i = 0; i < size; i++) {
		gradients[@i] = array_create(input.size, 0);
	}
	
	/// @func	Backward();
	/// @desc	Backpropagate error to input layer. Neuron delta is related to neuron activity.
	/// @desc	Updates neuron's part for total error for several examples (cumulative delta)
	/// @desc	Updates weights's part for total error for several examples (cumulative gradients)
	static Backward = function() {
		var Derivative = DERIVATIVE_FUNC[activation];					// Find derivative of activation function by array-lookup
		for(var i = 0; i < size; i++) {									// Loop through every neuron
			var deltaActivity = delta[i] * Derivative(activity[i]);		// Use derivative of activation function. Uses neuron activity before activation function.
			deltaSum[@i] += deltaActivity;								// Cumulative error for neuron
			delta[@i] = 0;												// Reset delta for next Backward-pass
			for(var j = 0; j < input.size; j++) {						// Loop through every neuron of input layer
				gradients[@i][@j] += input.output[j] * deltaActivity;	// Accumulate gradients. Weight's part for total error.
				input.delta[@j] += weights[i][j] * deltaActivity;		// Backpropagate error to input-layer.
			}
		}
		// Keep number of backward-passess, so we can calculate average delta and gradients.
		session++;
	}
	
	/// @func	Apply(learnRate);
	/// @desc	Uses gradient descent to update weights & biases. Method is Stochastic Gradient Descent.
	/// @desc	Yuo can make minibatches, or single example, or all examples, depent on when Apply is called.
	/// @param	{real}	learnRate
	static Apply = function(learnRate) {
		// Update bias
		for(var i = 0; i < size; i++) {
			bias[@i] += -learnRate * deltaSum[i] / session;	// We want to go opposite direction of error. Divide by session to get average.
			deltaSum[@i] = 0;	// Restart delta for next Apply
		}
		
		// Update weights
		for(var i = 0; i < size; i++) {
		for(var j = 0; j < input.size; j++) {
			weights[@i][@j] += -learnRate * gradients[i][j] / session;	// We want to go opposite direction of error. Divide by session to get average.
			gradients[@i][@j] = 0;	// Restart gradients for next Apply
		}}
		
		// Reset pass-count
		session = 0;
	}
}
















