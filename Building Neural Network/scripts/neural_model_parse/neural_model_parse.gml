/// @func	neural_model_parse(jsonString, taped);
/// @desc	Creates new network from JSON-string
/// @desc	Uses dummy-network to copy values over to network
/// @param	{string}	jsonString
/// @param	{boolean}	taped
function neural_model_parse(_json, _taped=false) {
	// Try parsing - string can be invalid.
	try {
		var _layers = json_parse(_json);	// Array of "dummy"-layers
		var _size = array_length(_layers);	// Amount of layers
		// Create network
		var _network = _taped
			? new neural_taped_network()
			: new neural_network();
		// Copy structure and parameters
		for(var i = 0; i < _size; i++) {
			neural_add_structure(_network, _layers[i]);
			neural_model_copy_layer(_network.layers[i], _layers[i]);
		}
		return _network;

	// If parsing failed
	}  catch(_error) {
		show_debug_message(_error);
		show_debug_message("Parsing JSON failed. Check string validity.");
		return undefined; // To let know parsing failed.
	}
}

/// @func	neural_add_structure(network, layer);
/// @desc	Adds structural copy of a source layer by using target network builder.
/// @param	{struct}	network
/// @param	{layer}		layer
function neural_add_structure(_network, _layer) {
	var _add = _network.add;
	var _size = _layer.size;
	switch(_layer.type) {
		case LayerType.INPUT:	return _add.Input(_size);
		case LayerType.DENSE:	return _add.Dense(_size, _layer.activation);
		default: throw("Undefined layer structure type.");
	}
}













