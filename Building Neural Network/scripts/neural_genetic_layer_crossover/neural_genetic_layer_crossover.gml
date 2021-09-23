
///	@func	neural_genetic_layer_crossover(child, parentA, parentB);
/// @desc	Modifies child/target layer by copying parts from parents.
/// @desc	Assumes that layers have same architeture (type, size etc.).
/// @param	{layer}	child		Target layer where modifications are done
/// @param	{layer}	parentA		
/// @param	{layer}	parentB		
function neural_genetic_layer_crossover(child, A, B) {
	with(child) {	// Work within layer
	switch(type) {	// Layer type
		
	// DENSE - Weights and biases.
	case LayerType.DENSE:
		for(var i = 0; i < size; i++) {
			bias[@i] = choose(A,B).bias[i];
			for(var j = 0; j < input.size; j++) {
				weights[@i][@j] = choose(A,B).weights[i][j];
			}
		}
		break;
	
	// If there are more layer types with parameters, should be added here.
	default: break;
	}}
}





