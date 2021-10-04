

///	@func	neural_model_parse(jsonString, taped);
/// @desc	Creates new network from JSON string.
/// @desc	Uses dummy-network to copy over to target network.
/// @param	{string}	jsonString		Stringified network.
function neural_model_parse(_json, _taped=false) {
	// Try parsing
	try {
		var _dummy = {}; // Dummy network
			_dummy.layers = json_parse(_json);
			_dummy.size = array_length(_dummy.layers);
		return neural_model_copy(_dummy,_taped);
		
	// If parsing failed
	} catch(_error) {
		show_debug_message(_error);
		throw("Parsing JSON failed. Check string validity.");
	}
}




