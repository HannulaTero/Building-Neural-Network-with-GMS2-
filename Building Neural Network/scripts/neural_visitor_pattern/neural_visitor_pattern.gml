

/// @func	neural_visitor_pattern();
/// @desc	Base constructor for visitor pattern design.
function neural_visitor_pattern() constructor {
	static visit_Default = function(_layer) {throw("Undefined layer behaviour.");};
	static visit_Input = function(_layer) {};
	static visit_Dense = function(_layer) {};
}


