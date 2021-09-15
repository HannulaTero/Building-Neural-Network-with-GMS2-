
/// @func	neural_builder(target);
/// @desc	Helper struct for adding new layers to neural network, so we don't them to be in main constructor.
/// @param	{neural_network}	target
function neural_builder(_target) constructor {
	nn = _target; // {struct}	Target neural network.
	
	/// @func	ADD(layer);
	/// @desc	Helper function for adding layers to target neural network.
	static ADD = function(_layer) {
		array_push(nn.layers, _layer);			// Add created layer to network
		nn.last = _layer;						// Update reference for last layer
		nn.size = array_length(nn.layers);		// Update count of layers
		return _layer;							// Return layer reference just in case if user wants to do something else with it.
	}
	
	/// @func	Input(size);
	///	@desc	Set input-layer for target network.
	/// @param	{int}	size
	static Input = function(_size) {
		if (!is_undefined(nn.first)) {
			throw("Cannot add another Input-layer");
		}
		nn.first = (nn.taped)
			? ADD(new neural_taped_input(_size))
			: ADD(new neural_layer_input(_size));
		return nn.first; 
	}
	
	/// @func	Dense(size, activation);
	/// @desc	Create new fully-connected layer for target network.
	/// @param	{int}	size		How many neurons layer will have. Size of layer.
	/// @param	{enum}	activation	Enum-identifier for activation function, index for global array.
	static Dense = function(_size, _activation) {
		return (nn.taped)
			? ADD(new neural_taped_dense(nn.last, _size, _activation)) 
			: ADD(new neural_layer_dense(nn.last, _size, _activation)); 
	}
}



















