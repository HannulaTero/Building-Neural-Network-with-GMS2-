/// @desc CREATE POPULATION
x = room_width/2;
y = room_height/2;
depth = 10;

/// Create population
count = 50;
population = array_create(count);
for(var i = 0; i < count; i++) {
	var xx = x + random_range(-200, 200);
	population[@i] = instance_create_depth(xx, 0, -1, obj_example_genetic_specimen);
}

// Create ground
instance_create_depth(x, y+32, 1, obj_example_genetic_floor);

// Information
generation = 0;	
alive = count;
time = 0;
level = 0;
best = 0;
show = noone;



