
///	@func	neural_model_loader();
/// @desc	
function neural_model_loader() : neural_visitor_pattern() constructor {
	buffer = undefined;	// {buffer}		Where read values to network.
	add = undefined;	// {builder}	Layer builder of target network.
	accuracy = 0;		// {constant}	How to read parameters.
	
	/// @func	Load(target, buffer);
	/// @desc	Loads layers from buffer to target network. Reading order matters.
	/// @param	{network}	target
	/// @param	{buffer}	buffer
	static Load = function(_target, _buffer) {
		// PREPARE
		buffer = _buffer;
		add = _target.add;
		_target.Destroy();

		// HEADER - Read general information for loading network.
		var _bytes = buffer_read(buffer, buffer_f64); // Not used.
		var _count = buffer_read(buffer, buffer_f64); // Layer count
		accuracy = buffer_read(buffer, buffer_f64);	
	
		// LAYER INFORMATION
		// Create layers and update their parameters
		for(var i = 0; i < _count; i++) {
			var _type = buffer_read(buffer, accuracy);
			var _size = buffer_read(buffer, accuracy);
			switch(_type) {
				case LayerType.INPUT:	case_Input(_size);	break;
				case LayerType.DENSE:	case_Dense(_size);	break;
				default: visit_Default(_target);	break;
			}
		}
	}
	
	///________________________________________________________________________________________________________________
	///
	/// CASE METHODS
	///________________________________________________________________________________________________________________
	static case_Input = function(_size) {
		return add.Input(_size);
	}
	
	static case_Dense = function(_size) {
		// Read Activation function
		var _activation = buffer_read(buffer, accuracy);
		
		// Create the Layer
		var _layer = add.Dense(_size, _activation);
		var _weights = _layer.weights;
		var _bias = _layer.bias;
		
		// Read Bias
		for(var i = 0; i < _size; i++) {
			_bias[@i] = buffer_read(buffer, accuracy);
		}
		
		// Read Weights
		var _inputSize = _layer.input.size;
		for(var i = 0; i < _size; i++) {
		for(var j = 0; j < _inputSize; j++) {
			_weights[@i][@j] = buffer_read(buffer, accuracy);
		}}
	}
}


	
	
	
	
