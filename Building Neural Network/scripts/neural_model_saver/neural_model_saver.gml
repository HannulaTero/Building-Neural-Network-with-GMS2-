

///	@func	neural_model_saver();
/// @desc	Creates buffer from of network, which can be loaded later. Buffer needs to be explicitly destroyed.
/// @desc	Can determine accuracy for layer parameters, which can greatly affect file-size with large networks.
function neural_model_saver() : neural_visitor_pattern() constructor {
	buffer = undefined;		// {buffer}		Where parameters are saved
	accuracy = buffer_f32;	// {constant}	Which accuracy parameters are saved
	
	/// @func	Save(target, accuracy);
	/// @param	{network}	target
	/// @param	{constant}	accuracy	Buffer constant: buffer_f64, _f32 or _f16.
	static Save = function(_target, _accuracy=buffer_f32) {
		// PREPARE
		accuracy = _accuracy;
		buffer = buffer_create(1024, buffer_grow, buffer_sizeof(accuracy));
	
		// HEADER : Information about reading the buffer. 
		buffer_write(buffer, buffer_f64, 0);			// Size of buffer. Updated later.
		buffer_write(buffer, buffer_f64, _target.size);	// Amount of layers
		buffer_write(buffer, buffer_f64, accuracy);		// Accuracy for parameters
		
		// SAVE LAYER INFORMATION
		var _size = _target.size;
		var _layers = _target.layers;
		for(var i = 0; i < _size; i++) {
			_layers[i].Accept(self);
		}
	
		// TRIM BUFFER SIZE
		var _bytes = buffer_tell(buffer);
		buffer_resize(buffer, _bytes);
		buffer_poke(buffer, 0, buffer_f64, _bytes);
	
		// RETURN BUFFER
		return buffer;
	}
	
	///________________________________________________________________________________________________________________
	///
	/// VISITOR METHODS
	///________________________________________________________________________________________________________________
	static Common = function(_layer) {
		buffer_write(buffer, accuracy, _layer.type);
		buffer_write(buffer, accuracy, _layer.size);
	}
	
	static visit_Input = function(_layer) {
		Common(_layer);
	}
	
	static visit_Dense = function(_layer) {
		Common(_layer);
		
		// Activation
		buffer_write(buffer, accuracy, _layer.activation);
		
		// Bias
		var _size = _layer.size;
		for(var i = 0; i < _size; i++) {
			buffer_write(buffer, accuracy, _layer.bias[i]);
		}
		
		// Weights
		var _inputSize = _layer.input.size;
		for(var i = 0; i < _size; i++) {
		for(var j = 0; j < _inputSize; j++) {
			buffer_write(buffer, accuracy, _layer.weights[i][j]);
		}}
	}
}






