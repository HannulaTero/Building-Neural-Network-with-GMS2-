
/// @func	neural_model_save(network, accuracy);
/// @desc	Saves network into a buffer.
/// @desc	Buffer has 3 parts: accuracy, JSON, parameter-numbers
/// @desc	Accuracy is stored as a first byte.
/// @param	{struct}	network
/// @param	{constant}	accuracy
function neural_model_save(_target, _accuracy=buffer_f32) {
	/// Prepare
	var _size	= _target.size;
	var _layers = _target.layers;
	var _dummy	= array_create(_size);
	var _buffer = buffer_create(1024, buffer_grow, 1);
		
	// Write JSON 
	for(var i = 0; i < _size; i++) {
		_dummy[i] = new neural_dummy_structure(_layers[i]);
	}
	var _struct = {};
		_struct.layers = _dummy;
		_struct.accuracy = _accuracy;
	var _json = json_stringify(_struct);
	buffer_write(_buffer, buffer_string, _json);
	
	// Write parameters
	for(var i = 0; i < _size; i++) {
		neural_write_parameters(_buffer, _layers[i], _accuracy);
	}
	
	// Trim buffer and return result
	buffer_resize(_buffer, buffer_tell(_buffer));
	buffer_seek(_buffer, buffer_seek_start, 0);
	return _buffer;
}

/// @func	neural_dummy_structure(target);
/// @desc	Creates dummy-structure for stringifying to JSON.
/// @param	{layer}	target
function neural_dummy_structure(_layer) constructor {
	/// GENERAL INFORMATION
	type = _layer.type;
	size = _layer.size;
	
	/// TYPE-SPECIFIC INFORMATION
	switch(_layer.type) {
		
		// DENSE - Activation
		case LayerType.DENSE:
			activation = _layer.activation;
			break;
		
		// DEFAULT - No other information
		default: break;
	}
}


/// @func	neural_write_parameters(buffer, layer, accuracy);
/// @desc	Writes layer parameters into buffer.
/// @param	{buffer}	buffer
/// @param	{struct}	layer
/// @param	{constant}	accuracy
function neural_write_parameters(_buffer, _layer, _accuracy) {
	switch(_layer.type) {
		
		// DENSE - Weights and biases
		case LayerType.DENSE:
			
			// Biases
			var _size = _layer.size;
			for(var i = 0; i < _size; i++) {
				buffer_write(_buffer, _accuracy, _layer.bias[i]);
			}
			
			// Weights
			var _inputSize = _layer.input.size;
			for(var i = 0; i < _size; i++) {
			for(var j = 0; j < _inputSize; j++) {
				buffer_write(_buffer, _accuracy, _layer.weights[i][j]);
			}}
			break;
		
		// DEFAULT - No parameters.
		default: break;		
	}
}























