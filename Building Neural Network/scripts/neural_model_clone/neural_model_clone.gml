

///	@func	neural_model_clone(source, taped);
/// @desc	Creates a new copy of source network 
/// @param	{network}	source
/// @param	{bool}		taped
function neural_model_clone(_source, _taped=false) {
	var _network = _taped ? new neural_taped_network() : new neural_network();
	var _add = _network.add;
	for(var i = 0; i < _source.size; i++) {
		neural_model_layer_clone(_add, _source.layers[i]);
	}
	return _network;
}


///	@func	neural_model_layer_clone(add, source);
/// @desc	Creates copy of a source layer. 
/// @param	{builder}	add
/// @param	{layer}		source
function neural_model_layer_clone(_add, _source) {
	var _size = _source.size;
	switch(_source.type) {
		
	// INPUT
	case LayerType.INPUT: 
		_add.Input(_size); 
		break;
			
	// DENSE - Copy activation, weights & biases.
	case LayerType.DENSE: 
		// Create the layer
		var _new = _add.Dense(_size, _source.activation); 
		var _bias = _new.bias;
		var _weights = _new.weights;

		// Copy biases
		array_copy(_bias, 0, _source.bias, 0, _size);
		
		// Copy weights
		var _inputSize = _new.input.size;
		for(var i = 0; i < _size; i++) {	
			array_copy(_weights[i], 0, _source.weights[i], 0, _inputSize);
		}
		break;
		
	// DEFAULT - Undefined layer type, can't copy.
	default: 
		throw("Undefined layer type for cloning."); 
		break;
	}
}

















