

///	@func	neural_model_save(network, accuracy);
/// @desc	Creates buffer from of network, which can be loaded later. Buffer needs to be explicitly destroyed.
/// @desc	Can determine accuracy for layer parameters, which can greatly affect file-size with large networks.
/// @param	{network}	network
/// @param	{constant}	accuracy	Buffer constant: buffer_f64, _f32 or _f16.
function neural_model_save(_network, _accuracy=buffer_f32) {
	// CREATE BUFFER
	var _sizeof = buffer_sizeof(_accuracy);
	var _buffer = buffer_create(1024, buffer_grow, _sizeof);
	
	// HEADER : Information about reading the buffer. 
	buffer_write(_buffer, buffer_f64, 0);				// Size of buffer. Updated later.
	buffer_write(_buffer, buffer_f64, _network.size);	// Amount of layers
	buffer_write(_buffer, buffer_f64, _accuracy);		// Accuracy for parameters
		
	// LAYER INFORMATION
	var _size = _network.size;
	var _layers = _network.layers;
	for(var i = 0; i < _size; i++) {
		neural_model_layer_save(_layers[i], _buffer, _accuracy);
	}
	
	// TRIM BUFFER SIZE
	var _bytes = buffer_tell(_buffer);
	buffer_resize(_buffer, _bytes);
	buffer_poke(_buffer, 0, buffer_f64, _bytes);
	
	// RETURN BUFFER
	return _buffer;
}


///	@func	neural_model_layer_save(layer, buffer, accuracy);
/// @desc	Writes layer information into given buffer
/// @param	{layer}		layer
/// @param	{buffer}	buffer
/// @param	{constant}	accuracy
function neural_model_layer_save(_layer, _buffer, _accuracy) {
	// GENERAL INFORMATION
	buffer_write(_buffer, _accuracy, _layer.type);
	buffer_write(_buffer, _accuracy, _layer.size);
		
	// TYPE SPECIFIC INFORMATION
	switch(_layer.type) {
			
		// DENSE - activation, bias and weights
		case LayerType.DENSE:
			// Activation
			buffer_write(_buffer, _accuracy, _layer.activation);
			
			// Bias
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
			
		// DEFAULT - No other needed parameters
		default: break;
	}
}





