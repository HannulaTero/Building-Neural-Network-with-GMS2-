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
	static learnable = false;			// {bool}	Tells if layer has learnable parameters. 
	static taped = false;				// {bool}	Tells if layer has gradients-structure.
	size = _size;						// {int}	Neuron count, size of layer
	input = undefined;					// {layer}	Reference to another neural layer
	output = array_create(size, 0);		// {array}	Neuron activities. Implicit neurons.
	
	/// @func	Forward();
	/// @desc	How neuron activities are updated
	static Forward = function() {};
	
	/// @func	Copy(target);
	/// @desc	Copies parameters from given layer. Expects same architecture.
	/// @param	{layer}	target
	static Copy = function() {};
	
	/// @func	CrossOver(...);
	/// @desc	Copies parameters randomly from given layers. Expects same architecture.
	static CrossOver = function() {};
	
	/// @func	Mutate(amount, rate);
	/// @desc	Change parameters randomly
	/// @param	{real}	amount
	/// @param	{real}	rate
	static Mutate = function(amount, rate) {};
	
	/// @func	Destroy();
	/// @desc	Destroying the layer, if there are data-structures which needs to be deleted
	static Destroy = function() {};
	
	/// @func	Draw(x, y, scale, xspacing, yspacing);
	/// @desc	Visualizes layers neuron activities with given position and scale. Makes y-origin at middle.
	/// @param	{real}	x
	/// @param	{real}	y
	/// @param	{real}	scale
	/// @param	{real}	xspacing
	/// @param	{real}	yspacing
	static Draw = function(xx, yy, scale, xspacing, yspacing) {
		yy -= yspacing * size/2;
		for(var i = 0; i < size; i++) {
			var color = neuron_color(output[i]);
			draw_sprite_ext(spr_neuron, 0, xx, yy, scale, scale, 0, c_white, 1);
			draw_sprite_ext(spr_neuron, 1, xx, yy, scale, scale, 0, color, 1);
			yy += yspacing;
		}
	}
}


















