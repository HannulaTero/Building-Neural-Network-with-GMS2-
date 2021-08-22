/// @func	neural_layer_input(size);
/// @desc	Creates new network layer, which has no "previous" layer.
/// @param	{int}	size
function neural_layer_input(_size) : neural_layer_base(_size) constructor {
	static type = LayerType.INPUT;
	
	/// @func	Forward(input);
	/// @desc	Updates layer neurons activity by given array.
	/// @param	{array}	input
	static Forward = function(_input) {
		var count = min(array_length(output), array_length(_input));
		array_copy(output, 0, _input, 0, count);
	}
}