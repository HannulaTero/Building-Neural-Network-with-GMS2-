
/// @func	neural_model_copy(destination, source);
/// @desc	Copies parameters to network from another.
/// @param	{struct}	destination
/// @param	{struct}	source
function neural_model_copy(_dest, _source) {
	var _size = _dest.size;
	for(var i = 0; i < _size; i++) {
		// Sanity-check
		var _layerD = _dest.layers[i];	
		var _layerS = _source.layers[i];
		if (_layerD.type != _layerS.type)
		|| (_layerD.size != _layerS.size) {
			throw("Layer structures do not match.");
		}
		// Copy parameters
		neural_model_copy_layer(_layerD, _layerS);
	}
}

/// @func	neural_model_copy_layer(destination, source);
/// @desc	Copies layer parameters from another layer.
/// @param	{layer}	destination
/// @param	{layer}	source
function neural_model_copy_layer(_dest, _source) {
	var _size = _source.size;
	switch(_source.type) {
		// DENSE - Weights and biases.
		case LayerType.DENSE:			
			array_copy(_dest.bias, 0, _source.bias, 0, _size);
			var _inputSize = _dest.input.size;
			for(var i = 0; i < _size; i++) {
				array_copy(_dest.weights[i], 0, _source.weights[i], 0, _inputSize);
			}
			break;
			
		// DEFAULT - No copyable parameters
		default: break;
	}
}



