

/// @func	neural_taped_input(size);
/// @desc	Creates input-layer with gradients-structure
/// @param	{int}	size
function neural_taped_input(_size) : neural_layer_input(_size) constructor {
	static taped = true;			// {bool}	Tells if layer has gradients-structure.
	delta = array_create(size, 0);	// {array}	For receiving gradient information from backpropagation.
	
	/// @func	Backward();
	static Backward = function() {
		// No actual action, only clear delta
		for(var i = 0; i < size; i++) {
			delta[@i] = 0;
		}
	}
}