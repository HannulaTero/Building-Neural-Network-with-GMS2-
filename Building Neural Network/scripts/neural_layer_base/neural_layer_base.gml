///
enum LayerType {
	BASE,
	INPUT,
	DENSE
}

/// @func	neural_layer_base(size);
/// @desc	Base for every neural network layers, which all layers inherit. Isn't actual useable layer.
/// @param	{int}	size	Count of neurons
function neural_layer_base(_size){
	static type = LayerType.BASE;		// {enum}	Which kind of layer. 
	size = _size;						// {int}	Neuron count, size of layer
	input = undefined;					// {layer}	Reference to another neural layer
	output = array_create(size, 0);		// {array}	Neuron activities. Implicit neurons.
	
	/// @func	Forward();
	/// @desc	How neuron activities are updated
	static Forward = function() {};
	
	/// @func	Destroy();
	/// @desc	Destroying the layer, if there are data-structures which needs to be deleted
	static Destroy = function() {};
	
	/// @func	Draw(x, y, scale);
	/// @desc	Visualizes layers neuron activities with given position and scale. Makes y-origin at middle.
	/// @param	{real}	x
	/// @param	{real}	y
	/// @param	{real}	scale
	static Draw = function(xx, yy, scale) {
		yy -= scale * size/2;
		for(var i = 0; i < size; i++) {
			var value = output[i];
			var R = clamp(-min(0, value)*255, 0, 255);
			var G = clamp(+max(0, value)*255, 0, 255);
			var B = 32;
			var color = make_color_rgb(R, G, B);
			draw_circle_color(xx, yy, scale*.5-0, c_dkgray, c_dkgray, false);
			draw_circle_color(xx, yy, scale*.5-2, c_black, c_black, false);
			draw_circle_color(xx, yy, scale*.5-4, color, color, false);
			yy += scale;
		}
	}
}


















