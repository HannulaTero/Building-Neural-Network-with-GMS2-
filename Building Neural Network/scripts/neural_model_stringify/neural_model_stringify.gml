

///	@func	neural_model_stringify(target);
/// @desc	Creates JSON-string of network, which can be parsed later. 
/// @desc	Uses GMS2 own JSON stringifier with dummy-layers to constrain what information is stored, and avoid circular references
/// @param	{struct}	network
function neural_model_stringify(_target) {
	// Use dummy-layers to control what information we stringify
	var _size = _target.size;
	var _layers = _target.layers;
	var _dummy = array_create(_size);
	for(var i = 0; i < _size; i++) {
		_dummy[i] = new neural_dummy_layer(_layers[i]);
	}
	
	// Stringify and return JSON-string
	return json_stringify(_dummy);
}


/// @func	neural_dummy_layer(target);
/// @desc	Creates dummy-layer for parsing. Picks references for necessary information
/// @param	{layer} target
function neural_dummy_layer(_layer) constructor {
	/// GENERAL INFORMATION 
	type = _layer.type;
	size = _layer.size;
	
	// TYPE-SPECIFIC INFORMATION
	switch(_layer.type) {
		
		// DENSE - Activation, weights & biases 
		case LayerType.DENSE:
			activation = _layer.activation;
			weights = _layer.weights;
			bias = _layer.bias;
			break;
		
		// DEFAULT - No other parameters
		default: break;
	}
}

