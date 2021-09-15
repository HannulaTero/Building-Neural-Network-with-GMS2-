/*

	TESTING
	TO USE GRADIENT TAPES LIKE THESE ALLOWS OTHER GRADIENT DESCENT OPTIMIZERS


/// @func	neural_gradient_tape(target);
/// @desc	Creates struct for storing gradients tape for given array
/// @param	{array}	target
function neural_gradient_tape(_target) constructor {
	target = _target;
	size = array_length(_target);
	tape = array_create(size, 0);
	session = 0;
	
}

function neural_gradient_descent(target) : neural_gradient_tape(target) constructor {
	/// @func	Apply(learnRate);
	/// @desc	Applies normal gradient descent to target array.
	/// @param	{real}	learnRate
	static Apply = function(learnRate) {
		// Update parameter with gradients
		for(var i = 0; i < size; i++) {
			target[@i] += -learnRate * tape[i] / session;	
			tape[@i] = 0;
		}
		
		// Reset pass-count
		session = 0;
	}
}