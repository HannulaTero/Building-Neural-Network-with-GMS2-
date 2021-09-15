

/// @func	neural_taped_dense(input, size, activation);
/// @desc	Creates dense-layer with gradients-structures.
/// @param	{layer}	input		Neural network layer
/// @param	{int}	size		Count of neurons
/// @param	{enum}	activation	Enum identifier for activation function.
function neural_taped_dense(_input, _size, _activation) : neural_layer_dense(_input, _size, _activation) constructor {
	static taped = true;				// {bool}		Tells if layer has gradients-structure.
	session = 0;						// {int}		How many passes has been made, for calculating averages
	delta = array_create(size, 0);		// {array}		For receiving gradient information from backpropagation.
	
	// Gradient tapes for learnable parameters
	tape_bias = array_create(size, 0);	// {array}		Cumulative gradients tape for bias. 
	tape_weights = array_create(size);	// {array2D}	Cumulative gradients tape for weights. 
	for(var i = 0; i < size; i++) {
		tape_weights[@i] = array_create(input.size, 0);
	}
	
	/// @func	Backward();
	/// @desc	Pass gradient information to next layer. Update gradient-tapes.
	static Backward = function() {
		var Derivative = DERIVATIVE_FUNC[activation];				// Find derivative of activation function by array-lookup
		for(var i = 0; i < size; i++) {								// 
			var gradient = delta[i] * Derivative(activity[i]);		// Calculate gradient for neuron activity.
			for(var j = 0; j < input.size; j++) {					// 
				input.delta[@j] += weights[i][j] * gradient;		// Pass neuron gradient information to next layer
				tape_weights[@i][@j] += input.output[j] * gradient;	// Calculate gradient for weight
			}														// 
			tape_bias[@i] += gradient;								// Calculate gradient for bias
			delta[@i] = 0;											// Reset delta for next Backward-pass
		}
		// Keep number of backward-passes to calculate average gradients.
		session++;
	}
	
	/// @func	Apply(learnRate);
	/// @desc	Uses Gradient Descent to update learnable parameters. 
	/// @param	{real}	learnRate
	static Apply = function(learnRate) {
		// Update bias
		for(var i = 0; i < size; i++) {
			bias[@i] += -learnRate * tape_bias[i] / session;	
			tape_bias[@i] = 0;
		}
		
		// Update weights
		for(var i = 0; i < size; i++) {
		for(var j = 0; j < input.size; j++) {
			weights[@i][@j] += -learnRate * tape_weights[i][j] / session;	
			tape_weights[@i][@j] = 0;
		}}
		
		// Reset pass-count
		session = 0;
	}
}
















