
/// @func	neural_network();
/// @desc	Creates base structure for neural network. Layers are added with builder.
function neural_network() constructor {
	static taped = false;	// {bool}	Does the network have gradients-structure.
	layers	= [];			// {array}	Holds all layers of neural network
	size	= 0;			// {int}	(for easy-to-access) How many layers network has
	first	= undefined;	// {layer}	(for easy-to-access) First layer of layers-array.
	last	= undefined;	// {layer}	(for easy-to-access) Last layer of layers-array.
	add		= new neural_builder(self); // For creating new layers for neural network.
	
	///________________________________________________________________________________________________________________
	///
	/// FORWARD -PASS
	///________________________________________________________________________________________________________________
	/// @func	Input(input);
	/// @desc	Updates neurons' activity of first layer
	/// @param	{any}	input	Depends from input-layer what information needs to fed. Currently just an array.
	static Input = function(_input) {
		first.Forward(_input);
	}
	
	/// @func	Forward(input);
	/// @desc	Propagates signal from first layer towards last layer.
	/// @param	{any}	input	[optional] updates first layer activity by given argument. Otherwise skipped.
	static Forward = function(_input) {
		// If input values are defined, do forward pass for first layer. Otherwise skip
		if (!is_undefined(_input)) Input(_input);
		
		// Forward pass for other layers (skip first)
		for(var i = 1; i < size; i++) {
			layers[i].Forward();
		}
		
		// Return prediction
		return last.output;
	}
	
	///________________________________________________________________________________________________________________
	///
	/// GENERAL FUNCTIONS
	///________________________________________________________________________________________________________________	
	/// @func	Destroy();
	/// @desc	Makes network empty hull. New layers layers can be added.
	static Destroy = function() {
		for(var i = 0; i < size; i++) {
			layers[i].Destroy();
		}
		layers = [];
		size	= 0;
		first	= undefined;	
		last	= undefined;		
	}
}












