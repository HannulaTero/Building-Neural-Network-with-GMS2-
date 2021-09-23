/// @desc CREATE POPULATION
x = room_width/2;
y = room_height/2;
depth = 10;

/// Create population
count = 50;
population = array_create(count);
for(var i = 0; i < count; i++) {
	var xx = x + random_range(-128, 128);
	population[@i] = instance_create_depth(xx, 0, -1, obj_example_b_genetic_specimen);
}

// Create level
ground = instance_create_depth(x, y+32, 1, obj_example_b_genetic_floor);

// Information
generation = 0;	
dead = 0;
time = 0;
level = 0;
best = 0;



