

///	@func	neural_model_parser();
/// @desc	Parses layers from JSON string to target network.
/// @desc	Uses dummy-network to copy over to target network.
function neural_model_parser() : neural_model_copier() constructor {
	add = undefined;	// {builder}	Builder of Target network.
	
	/// @func	Parse(target, jsonString);
	/// @desc	Copies network from JSON-string. 
	/// @param	{network}	target			Target network where layers are parsed.
	/// @param	{string}	jsonString		Stringified network.
	static Parse = function(_target, _json) {	
		// PARSE JSON
		try {
			var _dummy = json_parse(_json);		// Parse to array of layers.
			var _size = array_length(_dummy);	// Count of layers.
		} catch(_error) {
			show_debug_message(_error);
			throw("Parsing JSON failed. Check string validity.");
			return false;
		}
			
		// COPY LAYERS - Dummies don't have Accept-method; choose manually.
		add = _target.add;	// Use target builder
		_target.Destroy();	// Destroy existing layers.
		for(var i = 0; i < _size; i++) {
			var _layer = _dummy[i];
			switch(_layer.type) {
				case LayerType.INPUT:	visit_Input(_layer);	break;
				case LayerType.DENSE:	visit_Dense(_layer);	break;
				default: visit_Default(_layer);	break;
			}
		}
		
		// PARSING SUCCEsSFUL
		return true;
	}

	///________________________________________________________________________________________________________________
	///
	/// VISITOR METHODS
	///________________________________________________________________________________________________________________
	// 
	// For now uses same methods as copier
	//
}




