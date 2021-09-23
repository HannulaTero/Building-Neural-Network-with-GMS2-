
/*______________________________________________________________________________________________________________

	
	Define all available acitvation function here for neural network.
	All activation function are stored in global array, and accessed by index / enum identifier.
	All activation function derivatives are stored in array.
	Derivative are accessed by same index as activation function.
	
________________________________________________________________________________________________________________
*/

// List of all available activation functions.
enum ActFunc {
	IDENTITY,	// Pass-through function
	TANH,
	SIGMOID,
	RELU,
	length
}

#macro	ACTIVATION_FUNC	global.gACTIVATION_FUNCTION_ARRAY
#macro	DERIVATIVE_FUNC global.gDERIVATIVE_FUNCTION_ARRAY

// Available activation functions stored in global array.
ACTIVATION_FUNC = [];								DERIVATIVE_FUNC = [];
ACTIVATION_FUNC[ActFunc.IDENTITY]	= Identity;		DERIVATIVE_FUNC[ActFunc.IDENTITY]	= IdentityDerivative;
ACTIVATION_FUNC[ActFunc.TANH]		= Tanh;			DERIVATIVE_FUNC[ActFunc.TANH]		= TanhDerivative;
ACTIVATION_FUNC[ActFunc.SIGMOID]	= Sigmoid;		DERIVATIVE_FUNC[ActFunc.SIGMOID]	= SigmoidDerivative;
ACTIVATION_FUNC[ActFunc.RELU]		= Relu;			DERIVATIVE_FUNC[ActFunc.RELU]		= ReluDerivative;


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
/// @func	IdentityDerivative(input);
/// @desc	Derivative of Identity-function
/// @param	{real}	input
function IdentityDerivative(input) {
	return 1;	// Simple as that.
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
/// @func	TanhDerivative(input);
/// @desc	Derivative of Tanh-function
/// @param	{real}	input
function TanhDerivative(input) {
	return (1 - sqr(Tanh(input)));
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
/// @func	SigmoidDerivative(input);
/// @desc	Derivative of Sigmoid-function
/// @param	{real}	input
function SigmoidDerivative(input) {
	input = Sigmoid(input);	// To call Sigmoid only once.
	return (input * (1 - input));
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
/// @func	ReluDerivative(input);
/// @desc	Derivative of Relu-function
/// @param	{real}	input
function ReluDerivative(input) {
	return (input > 0);
}























