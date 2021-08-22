
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