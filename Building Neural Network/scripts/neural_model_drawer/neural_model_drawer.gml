


/// @func	neural_model_drawer();
/// @desc	Visualizes network by drawing the layers. Makes x-origin at the middle of network.
function neural_model_drawer() : neural_visitor_pattern() constructor {
	x = 0;
	y = 0;
	scale = 1;
	width = 0;
	height = 0;

	/// @func	Draw(target, x, y, scale, xspacing, yspacing)
	static Draw = function(_target, _x, _y, _scale, _xspacing, _yspacing) {
		// PREPARE
		var _layers = _target.layers;
		var _size = _target.size;
		scale = _scale;
		width = _xspacing;
		height = _yspacing;
		x = _x + width * (.5-.5*_size);
		y = _y;
		
		// DRAW TYPE -SPECIFIC 
		for(var i = 0; i < _size; i++) {
			_layers[i].Accept(self);
		}
	
		// DRAW OUTPUTS
		for(var i = 0; i < _size; i++) {
			Output(_layers[i]);
		}
	}
	
	// Draw output for all layers.
	static Output = function(_target) {
		var _output = _target.output;
		var _size = _target.size;
		for(var i = 0; i < _size; i++) {
			var _color = neuron_color(_output[i]);
			var x1 = x;
			var y1 = y + height * (i+.5 - .5 *_size);
			draw_sprite_ext(spr_neuron, 0, x1, y1, scale, scale, 0, c_white, 1);
			draw_sprite_ext(spr_neuron, 1, x1, y1, scale, scale, 0, _color, 1);
		}
	}
	
	///________________________________________________________________________________________________________________
	///
	/// VISITOR METHODS
	///________________________________________________________________________________________________________________
	static visit_Input = function(_layer) {
	}
	
	static visit_Dense = function(_layer) {
		// Draw weights
		var _size = _layer.size;
		var _inputSize = _layer.input.size;
		for(var i = 0; i < _size; i++) {
		for(var j = 0; j < _inputSize; j++) {
			var _value = weights[i][j];
			var _color = neuron_color(_value);
			var _width = min(2, _value*8);
			var x1 = x;
			var x2 = x - width;
			var y1 = y + height * (i+.5 - .5 *_size);
			var y2 = y + height * (i+.5 - .5 *_inputSize);
			draw_line_width_color(x1, y1, x2, y2, _width, _color, _color);
		}}
	}
}











