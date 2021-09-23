
///	@func	neural_model_copy(network, taped);
/// @desc	Creates fresh copy of given network. 
/// @param	{struct}	network		Target network which is used to create copy.
/// @param	{bool}		taped		Wether new copy should have gradients-structure.
function neural_model_copy(_src, _taped) {
	// Create new model
	var _model = _taped ? neural_taped_network : neural_network;
	var _nn = new _model();
	
	// Copy layers
	with(_nn) {
	for(var i = 0; i < _src.size; i++) {
		var _layer = _src.layers[i];
		var _size = _layer.size;
		switch(_layer.type) {
			
		// INPUT - only size is needed
		case LayerType.INPUT:
			add.Input(_size);
			break;
				
		// DENSE - need to copy parameters
		case LayerType.DENSE:	
			add.Dense(_size, _layer.activation);
			array_copy(bias, 0, _src.bias, 0, size);
			for(var i = 0; i < size; i++) {	
				array_copy(weights[i], 0, _src.weights[i], 0, input.size);
			}	
			break;
		}
	}
	}
	return _nn;
}












