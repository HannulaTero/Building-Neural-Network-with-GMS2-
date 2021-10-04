

///	@func	neural_model_stringifier();
/// @desc	Creates JSON-string of network, which can be parsed later. Uses GMS2 own json-stringifier.
/// @desc	Uses dummy-layers to constrain what information is stored, and avoid circular references etc.
function neural_model_stringifier() : neural_visitor_pattern() constructor {
	
	/// @func	Stringify(target);
	/// @desc	Creates JSON-string of target network.
	/// @param	{network}	target
	static Stringify = function(_target) {

		// CREATE DUMMY LAYERS
		var _size = _target.size;
		var _layers = _target.layers;
		var _dummy = array_create(_size);	
		for(var i = 0; i < _size; i++) {
			_dummy[@i] = _layers[i].Accept(self);
		}
	
		// RETURN JSON
		return json_stringify(_dummy);
	}
	
	///________________________________________________________________________________________________________________
	///
	/// VISITOR METHODS
	///________________________________________________________________________________________________________________
	static visit_Input = function(_layer) {
		return {
			type : _layer.type,
			size : _layer.size,
		}
	}
	
	static visit_Dense = function(_layer) {
		return {
			type : _layer.type,
			size : _layer.size,
			activation : _layer.activation, 
			weights : _layer.weights,
			bias : _layer.bias,
		}
	}
}







