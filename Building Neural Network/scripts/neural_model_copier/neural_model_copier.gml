

///	@func	neural_model_copier();
/// @desc	Copies structure and parameters from another network.
/// @desc	Uses visitor pattern design.
function neural_model_copier() : neural_visitor_pattern() constructor {
	add = undefined; // {builder}	Builder of Target network.
	
	/// @func	Copy(target, source);
	/// @desc	Copies source layer structures to target network.
	/// @param	{network}	target
	/// @param	{network}	source
	static Copy = function(_target, _source) {
		add = _target.add;	// Use target builder to add layers.
		_target.Destroy();	// Destroy existing layers.
		for(var i = 0; i < _source.size; i++) {
			_source.layers[i].Accept(self);
		}
	}
	
	///________________________________________________________________________________________________________________
	///
	/// VISITOR METHODS
	///________________________________________________________________________________________________________________
	static visit_Input = function(_layer) {
		return add.Input(_layer.size);
	}
	
	static visit_Dense = function(_layer) {
		// CREATE LAYER
		var _last = add.Dense(_layer.size, _layer.activation);
		var _size = _last.size;
		var _inputSize = _last.input.size;
		
		// COPY BIAS
		array_copy(_last.bias, 0, _layer.bias, 0, _size);
		
		// COPY WEIGHTS
		for(var i = 0; i < _size; i++) {	
			array_copy(_last.weights[i], 0, _layer.weights[i], 0, _inputSize);
		}
		return _last;
	}
}

















