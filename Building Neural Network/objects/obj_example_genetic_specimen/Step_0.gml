/// @desc DECISION-MAKING

// INPUT - Cast ray
nn.first.output[@0] = Ray(x, y, 0, 256, obj_example_genetic_wall);

// THINK - Make prediction what should be done
nn.Forward();

// CONTROL - Press jump button
button = (nn.last.output[0] > 0); // Threshold activation.