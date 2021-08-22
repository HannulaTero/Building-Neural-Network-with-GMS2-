/// @desc HOW-TO-USE: CREATE

// Create network base structure, then add layers
nn = new neural_network();
nn.add.Input(2);
nn.add.Dense(16, ActFunc.TANH);
nn.add.Dense(32, ActFunc.TANH);
nn.add.Dense(24, ActFunc.TANH);
nn.add.Dense(12, ActFunc.TANH);
nn.add.Dense(2, ActFunc.TANH);

// You can make function or method for predefined network.
// function Network() {
// 	var nn = new neural_network();
// 	nn.add.Input(2);
// 	nn.add.Dense(10, ActFunc.TANH);
// 	nn.add.Dense(5, ActFunc.RELU);
// 	nn.add.Dense(2, ActFunc.SIGMOID);
// 	return nn;
// }
// 
// nn = [];
// for(var i = 0; i < 100; i++) { // Creates 100 networks with same architechture
// 	nn[i] = Network();
// }




