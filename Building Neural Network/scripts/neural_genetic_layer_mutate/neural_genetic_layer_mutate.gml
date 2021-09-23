
///	@func	neural_genetic_layer_mutate(target, amount, rate);
/// @desc	Modifies target layer by randomly modifying parameters.
/// @param	{layer}	target	Target layer where modifications are done
/// @param	{real}	amount	
/// @param	{real}	rate	
function neural_genetic_layer_mutate(target, amount, rate) {
	with(target) {	// Work within layer
	switch(type) {	// Layer type
			
	// DENSE - Weights and biases.
	case LayerType.DENSE:

		// Mutate biases
		repeat(max(1, amount * size)) {
			var i = irandom(size-1);
			bias[@i] += random_range(-rate, +rate);
		}	
		// Mutate weights
		repeat(max(1, amount * size * input.size)) {
			var i = irandom(size-1);
			var j = irandom(input.size-1);
			weights[@i][@j] += random_range(-rate, +rate);
		}
		break;
		
	// If there are more layer types with parameters, should be added here.
	default: break;
	}}
}





