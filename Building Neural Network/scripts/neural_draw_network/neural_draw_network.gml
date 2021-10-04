


/// @func	neural_draw_network(target, x, y, scale, xspacing, yspacing);
/// @desc	Visualizes network by drawing the layers. x-origin at the middle of network.
/// @param	{network}	target
/// @param	{real}		x
/// @param	{real}		y
/// @param	{real}		scale
/// @param	{real}		xspacing	
/// @param	{real}		yspacing
function neural_draw_network(_target, _x, _y, _scale, _xspacing, _yspacing) {	
	// PREPARE
	var _layers = _target.layers;
	var _size = _target.size;
		
	// DRAW TYPE -SPECIFIC 
	for(var i = 0; i < _size; i++) {
		var x1 = _x + (i+.5 - .5 *_size);
		var y1 = _y;
		neural_draw_layer_parameters(_layers[i], x1, y1, _scale, _xspacing, _yspacing);
	}
	
	// DRAW OUTPUTS
	for(var i = 0; i < _size; i++) {
		var x1 = _x + (i+.5 - .5 *_size);
		var y1 = _y;
		neural_draw_layer_output(_layers[i], x1, y1, _scale, _xspacing, _yspacing);
	}
}

/// @func	neural_draw_layer_output(layer, x, y, scale, xspacing, yspacing);
/// @desc	Visualizes layer output. y-origin at the middle of layer.
/// @param	{layer}	layer
/// @param	{real}	x
/// @param	{real}	y
/// @param	{real}	scale
/// @param	{real}	xspacing	
/// @param	{real}	yspacing
function neural_draw_layer_output(_layer, _x, _y, _scale, _xspacing, _yspacing) {
	var _output = _layer.output;
	var _size = _layer.size;
	for(var i = 0; i < _size; i++) {
		var _color = neuron_color(_output[i]);
		var x1 = _x;
		var y1 = _y + _yspacing * (i+.5 - .5 *_size);
		draw_sprite_ext(spr_neuron, 0, x1, y1, _scale, _scale, 0, c_white, 1);
		draw_sprite_ext(spr_neuron, 1, x1, y1, _scale, _scale, 0, _color, 1);
	}
}

/// @func	neural_draw_layer_parameters(layer, x, y, scale, xspacing, yspacing);
/// @desc	Visualizes layer parameters. Makes y-origin at the middle of layer.
/// @param	{layer}	layer
/// @param	{real}	x
/// @param	{real}	y
/// @param	{real}	scale
/// @param	{real}	xspacing	
/// @param	{real}	yspacing
function neural_draw_layer_parameters(_layer, _x, _y, _scale, _xspacing, _yspacing) {
	// TYPE SPECIFIC INFORMATION
	switch(_layer.type) {
			
		// DENSE - Create layer and read values.
		case LayerType.DENSE:
			// Draw weights
			var _weights = _layer.weights;
			var _size = _layer.size;
			var _inputSize = _layer.input.size;
			for(var i = 0; i < _size; i++) {
			for(var j = 0; j < _inputSize; j++) {
				var _value = _weights[i][j];
				var _color = neuron_color(_value);
				var _width = min(2, _value*8);
				var x1 = _x;
				var x2 = _x - _xspacing;
				var y1 = _y + _yspacing * (i+.5 - .5 *_size);
				var y2 = _y + _yspacing * (i+.5 - .5 *_inputSize);
				draw_line_width_color(x1, y1, x2, y2, _width, _color, _color);
			}}
			break;
		
		// DEFAULT - No draw-able parameters.
		default: break;
	}
}






