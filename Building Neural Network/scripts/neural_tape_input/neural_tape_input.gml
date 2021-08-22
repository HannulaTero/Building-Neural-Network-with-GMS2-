

/// @func	neural_tape_input(size);
/// @desc	Creates input-layer with gradients-structure
/// @param	{int}	size
function neural_tape_input(_size) : neural_layer_input(_size) constructor {
	delta = array_create(size, 0);
	
	/// @func	Backward();
	static Backward = function() {
		// No action, only clear delta
		for(var i = 0; i < size; i++) {
			delta[@i] = 0;
		}
	}
}