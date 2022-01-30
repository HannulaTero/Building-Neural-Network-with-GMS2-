

/// @func	neural_model_load(buffer, taped);
/// @desc	Creates new network from given buffer, which should store structure and parameters.
/// @desc	Doesn't consume buffer, you must still separately destroy it.
/// @param	{buffer}	buffer
/// @param	{boolean}	taped
function neural_model_load(_buffer, _taped) {
	// Try creating new network and load values
	try {
		// Read structure
		buffer_seek(_buffer, buffer_seek_start, 0);
		var _json = buffer_read(_buffer, buffer_string); // Structure as JSON
		var _struct = json_parse(_json);
		var _accuracy = _struct.accuracy;	// How accurately parameters are stored.
		var _layers = _struct.layers;		// Array of "dummy"-layers
		var _size = array_length(_layers);	// Amount of layers
		
		// Create network
		var _network = _taped 
			? new neural_taped_network() 
			: new neural_network();
			
		// Load parameters to layers
		for(var i = 0; i < _size; i++) {
			neural_add_structure(_network, _layers[i]); // Done in previous video.
			neural_model_load_parameters(_network.layers[i], _buffer, _accuracy);
		}
		
		return _network;
	
	// If something failed
	} catch(_error) {
		show_debug_message(_error);
		show_debug_message("Loading failed. Check error messages.");
		return undefined;
	}
}


/// @func	neural_model_load_parameters(target, buffer, accuracy);
/// @desc	Loads values from buffer to layer. Assumes buffer is at correct seek-position.
/// @param	{struct}	target
/// @param	{buffer}	buffer
/// @param	{constant}	accuracy
function neural_model_load_parameters(_target, _buffer, _accuracy) {
	var _size = _target.size;
	switch(_target.type) {
		
		// DENSE - Load weights and biases
		case LayerType.DENSE:
			var _bias = _target.bias;
			var _weights = _target.weights;
			var _inputSize = _target.input.size;
		
			// Load biases 
			for(var i = 0; i < _size; i++) {
				_bias[@i] = buffer_read(_buffer, _accuracy);
			}
			
			// Load weights
			for(var i = 0; i < _size; i++) {
			for(var j = 0; j < _inputSize; j++) {
				_weights[@i][@j] = buffer_read(_buffer, _accuracy);
			}}
		
			break;
		
		// DEFAULT - No parameters to load
		default: break;
	}
}

























