
/*

	Here is commonly used functions, which may not be needed for actual use etc.

*/

/// @func	neuron_color(input);
/// @desc	Gives out color depent on value. For visualizing network.
/// @param	{real}	input
function neuron_color(input) {
	var R = clamp(-min(0, input)*255, 0, 255);
	var G = clamp(+max(0, input)*255, 0, 255);
	var B = 32;
	return make_color_rgb(R, G, B);
}

/// @func	approximate_derivative(func, input);
/// @desc	Returns approximate derivative for function
/// @param	{function}	func
/// @param	{real}		input
function approximate_derivative(func, input) {
	return (func(input-.00001) - func(input+.00001)) / .00002;
}