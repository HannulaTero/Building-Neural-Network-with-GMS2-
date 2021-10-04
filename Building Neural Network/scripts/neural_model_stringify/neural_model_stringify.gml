

///	@func	neural_model_stringify(target);
/// @desc	Creates JSON-string of network, which can be parsed later. Uses GMS2 own json-stringifier.
/// @desc	Uses dummy-layers to constrain what information is stored, and avoid circular references etc.
/// @param	{network}	network
function neural_model_stringify(_target) {
	// Uses dummy-layers to control what information is stored.
	var _size = _target.size;
	var _layers = _target.layers;
	var _dummy = array_create(_size);
	for(var i = 0; i < _size; i++) {
		_dummy[@i] = new neural_dummy_layer(_layers[i]);	
	}
	
	// Return JSON-string
	return json_stringify(_dummy);
}


///	@func	neural_dummy_layer(target);
/// @desc	Creates dummy-layer for parsing, picks necessary information from target layer.
/// @desc	Only needs references for arrays, and parsers knows to parse them.
/// @param	{layer}	target
function neural_dummy_layer(_layer) constructor {
	// GENERAL INFORMATION
	type = _layer.type;
	size = _layer.size;
	
	// TYPE-SPECIFIC INFORMATION
	switch(_layer.type) {
		
		// DENSE - activation, weights & biases
		case LayerType.DENSE:
			activation = _layer.activation; 
			weights = _layer.weights;
			bias = _layer.bias;
			break;
		
		// DEFAULT - No other parameters
		default: break;
	}
}







