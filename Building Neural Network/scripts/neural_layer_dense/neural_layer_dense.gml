
/// @func	neural_layer_dense(input, size, activation);
/// @desc	Creates new neural network layer, which is "fully connected" to previous layer
/// @param	{layer}	input		Neural network layer
/// @param	{int}	size		Count of neurons
/// @param	{enum}	activation	Enum identifier for activation function.
function neural_layer_dense(_input, _size, _activation) : neural_layer_base(_size) constructor {
	static type = LayerType.DENSE;
	input = _input;				// {layer}		Previous layer where layer is connected to
	activation = _activation;	// {enum}		Stores enum identifier for activation function, for global activation function array.
	
	// Create structures for dense-layer parameters
	bias = array_create(size, 0);		// {array}		Neuron bias for activity
	weights = array_create(size);		// {array2D}	Neurons connections to input
	
	// Initialize weights and biases with starting values
	for(var i = 0; i < size; i++) {
		bias[@i] = random_range(-.2, +.2);
		weights[@i] = array_create(input.size, 0);
		for(var j = 0; j < input.size; j++) {
			weights[@i][@j] = random_range(-.5, +.5);
		}
	}
	
	/// @func	Forward();
	/// @desc	Propagates signal forward. Calculates neuron activity as weighted sum and then applies activation function.
	static Forward = function() {
		var Activation = ACTIVATION_FUNC[activation];	// Find activation function from global array.
		for(var i = 0; i < size; i++) {
			// Calculate weighted sum from inputs
			var weightedSum = 0;
			for(var j = 0; j < input.size; j++) {
				weightedSum += input.output[j] * weights[i][j];
			}
			// Neuron activity: weighted sum of previous layer added with bias. This is fed to activation function.
			output[@i] = Activation( weightedSum + bias[i] );
		}
	}
}









