
/*______________________________________________________________________________________________________________

	
	Define all available acitvation function here for neural network.
	All activation function are stored in global array, and accessed by index / enum identifier.

________________________________________________________________________________________________________________
*/

// List of all available activation functions.
enum ActFunc {
	IDENTITY,	// Pass-through function
	TANH,
	SIGMOID,
	RELU
}

#macro	ACTIVATION_FUNC	global.gACTIVATION_FUNCTION_ARRAY

// Available activation functions stored in global array.
ACTIVATION_FUNC = [];
ACTIVATION_FUNC[ActFunc.IDENTITY]	= Identity;
ACTIVATION_FUNC[ActFunc.TANH]		= Tanh;
ACTIVATION_FUNC[ActFunc.SIGMOID]	= Sigmoid;
ACTIVATION_FUNC[ActFunc.RELU]		= Relu;


//________________________________________________________________________________________________________________
//
//	IDENTITY
//________________________________________________________________________________________________________________
/// @func	Identity(input);
/// @desc	Pass-through function, doesn't modify input in any way.
/// @param	{real}	input
function Identity(input) {
	return input;
}

//________________________________________________________________________________________________________________
//
//	TANH
//________________________________________________________________________________________________________________
/// @func	Tanh(input);
/// @desc	Non-linear activation function. Creates S-curve. Return value is always between -1 and +1.
/// @param	{real}	input
function Tanh(input) {
	return ((2 / (1 + exp(-2 * input))) - 1);
}

//________________________________________________________________________________________________________________
//
//	SIGMOID
//________________________________________________________________________________________________________________
/// @func	Sigmoid(input);
/// @desc	Non-linear activation function. Creates S-curve similiar to Tanh. Return value is always between 0 and +1.
/// @param	{real}	input
function Sigmoid(input) {
	return (1 / (1 + exp(-input)));
}

//________________________________________________________________________________________________________________
//
//	RELU
//________________________________________________________________________________________________________________
/// @func	Relu(input);
/// @desc	Rectified linear unit. Non-linear activation function. Output is not "balanced" like sigmoid or tanh.
/// @param	{real}	input
function Relu(input) {
	return max(0, input);
}
















