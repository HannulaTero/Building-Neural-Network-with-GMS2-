/// @desc HOW-TO-USE: FORWARD-PASS

var input = [];
input[0] = mouse_x/room_width;
input[1] = mouse_y/room_height;

// Input can be set separately
nn.Input(input);
nn.Forward();

// Or can be set at same time
// nn.Forward(input);
// 
// // Or first neuron activities can be modified directly.
// nn.first.output[@0] = mouse_x/room_width;
// nn.first.output[@1] = mouse_y/room_height;
// nn.Forward();
// 
// // Calling Forward makes prediction.
// // Getting result from Forward pass.
// result = nn.Forward();
// 
// // Or later accessing last layers neuron activities
// result = nn.last.output;