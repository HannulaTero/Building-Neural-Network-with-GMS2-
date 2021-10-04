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
	static Forward = function() {
	};
			
	/// @func	Destroy();
	/// @desc	Destroying the layer, if there are data-structures which needs to be deleted
	static Destroy = function() {
	};
}


















