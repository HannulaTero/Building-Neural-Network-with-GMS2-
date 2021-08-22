


/// @func	neural_gradients();
/// @desc	Creates neural network, which contains gradients-structure for layers
function neural_gradients() : neural_network() constructor {
	taped = true;	// {bool}	Tells that network has gradients-structure.
	error = 0;		// {real}	(for convenience)	Latest error from training
	session = 0;	// {int}	(for convenience)	How many Backward-passes has been made
	add.gradients = true;	// Builder will create layers which have gradients-structure and can do backpropagation.
	
	///________________________________________________________________________________________________________________
	///
	/// BACKWARD -PASS
	///________________________________________________________________________________________________________________
	/// @func	Cost(targets, CostFunction);
	/// @desc	Calculates error for last layer/prediction by comparing to the given target values
	/// @param	{array}		targets			Target Values for example
	/// @param	{function}	CostFunction	A way of calculating error from target values
	static Cost = function(targets, CostFunction) {
		error = CostFunction(last.delta, last.output, targets);
		return error;
	}
	
	/// @func	Backward();
	/// @desc	Backpropagates previously calculated error from last layer towards the first one.
	static Backward = function() {
		// Backpropagate through layers, start from the last layer.
		for(var i = size-1; i > 0; i--) {	// We can skip input layer, as it doesn't have previous layer
			layers[i].Backward();			// Backpropagate error through network-
		}
		
		// For convenience keep count of backpropagations
		session++;
		
		// Return input-layers delta/part for error just in case user wants to do something with it
		return first.delta;
	}
	
	/// @func	Apply(learnRate);
	/// @desc	Uses average errors from several examples to update learnable parameters.
	/// @param	{real}	learnRate	How large steps are taken. Too small makes learning slower, too large overshoots the local minima
	static Apply = function(learnRate) {
		for(var i = 1; i < size; i++) {	// We can skip first/input layer 
			if (layers[i].learnable) {	// We can skip non-learnable layers
				layers[i].Apply(learnRate);
			}
		}
		// Restart the count
		session = 0;
	}
	
	
	///________________________________________________________________________________________________________________
	///
	/// GENERAL FUNCTIONS
	///________________________________________________________________________________________________________________
	/// @func	Destroy();
	/// @desc	Destroys all layers of the network.
	static BaseDestroy = Destroy;
	static Destroy = function() {
		BaseDestroy();
		error = 0;
		session = 0;
	}
}




















