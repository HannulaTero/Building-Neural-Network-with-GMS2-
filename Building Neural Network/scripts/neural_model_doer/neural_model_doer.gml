
/// @func	neural_model_doer();
/// @desc	Opens more functionality for network. Uses using visitor pattern design.
function neural_model_doer() constructor {
	
	// Visitors - All model share same.
	static copier = new neural_model_copier();
	static parser = new neural_model_parser();
	static stringifier = new neural_model_stringifier();
	static saver = new neural_model_saver();
	static loader = new neural_model_loader();
	static drawer = new neural_model_drawer();

	/// @func	Copy(source);
	/// @desc	Copies layers from another network
	/// @param	{network}	source		Source network
	static Copy = function(_source) {
		copier.Copy(self, _source);
		return self;
	}
	
	/// @func	Stringify();
	/// @desc	Creates JSON-string of network, which can be parsed later.
	static Stringify = function() {
		return stringifier.Stringify(self);
	}
	
	/// @func	Parse(jsonString);
	/// @desc	Parses layers from given JSON-string.
	/// @param	{string}	jsonString
	static Parse = function(_json) {
		parser.Parse(self, _json);
		return self;
	}
	
	/// @func	Save(accuracy);
	/// @desc	Saves network into buffer, which can be loaded later
	/// @param	{constant}	accuracy	Optional.
	static Save = function(_accuracy=buffer_f32) {
		return saver.Save(self, _accuracy);
	}
	
	/// @func	Load(buffer);
	/// @desc	Loads layers from given buffer
	/// @param	{buffer}	buffer.
	static Load = function(_buffer) {
		loader.Load(self, _buffer);
		return self;
	}
	
	/// @func	Draw(x, y, scale, xspacing, yspacing);
	/// @desc	Draws network
	static Draw = function(_x, _y, _scale, _xspacing, _yspacing) {
		drawer.Draw(self, _x, _y, _scale, _xspacing, _yspacing);
		return self;
	}
}

