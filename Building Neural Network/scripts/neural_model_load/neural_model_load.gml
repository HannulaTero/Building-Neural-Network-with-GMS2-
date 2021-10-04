
///	@func	neural_model_load(buffer, taped);
/// @desc	Creates network from a buffer.
/// @param	{buffer}	buffer
/// @param	{bool}		taped
function neural_model_load(_buffer, _taped=false) {	
	// PREPARE
	var _network = _taped ? new neural_taped_network() : new neural_network();
	var _add = _network.add;
	
	// HEADER
	// Read general information for loading network.
	var _bytes = buffer_read(_buffer, buffer_f64); // Not used, just to move seek-position
	var _size = buffer_read(_buffer, buffer_f64); 
	var _accuracy = buffer_read(_buffer, buffer_f64);
	
	// LAYER INFORMATION
	// Create layers and update their parameters
	for(var i = 0; i < _size; i++) {
		neural_model_layer_load(_add, _buffer, _accuracy);
	}
	
	// RETURN NEW NETWORK
	return _network;
}


///	@func	neural_model_layer_load(add, buffer, accuracy);
/// @desc	Adds new layer based on buffer reads. Assumes buffer-seek is correct position.
/// @param	{builder}	add
/// @param	{buffer}	buffer
/// @param	{constant}	accuracy
function neural_model_layer_load(_add, _buffer, _accuracy) {		
	// GENERAL INFORMATION
	var _type = buffer_read(_buffer, _accuracy);
	var _size = buffer_read(_buffer, _accuracy);

	// TYPE SPECIFIC INFORMATION
	switch(_type) {
		// INPUT - Create layer
		case LayerType.INPUT: 
			_add.Input(_size);
			break;
			
		// DENSE - Create layer and read values.
		case LayerType.DENSE:
			// Activation.
			var _activation = buffer_read(_buffer, _accuracy);
			
			// Create the layer
			var _new = _add.Dense(_size, _activation);
			var _bias = _new.bias;
			var _weights = _new.weights;
			
			// Bias
			for(var i = 0; i < _size; i++) {
				_bias[@i] = buffer_read(_buffer, _accuracy);
			}
			
			// Weights
			var _inputSize = _new.input.size;
			for(var i = 0; i < _size; i++) {
			for(var j = 0; j < _inputSize; j++) {
				_weights[@i][@j] = buffer_read(_buffer, _accuracy);
			}}
			break;
			
		// DEFAULT
		default: throw("Undefined layer type for loading."); break;
	}	
}
	
	
	
	
	
