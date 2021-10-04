/// @desc CREATE POPULATION

// Information
generation = 0;	
time = 0;
best = 0;

// For convenience
specimens = obj_example_genetic_B_specimen;
floors = obj_example_genetic_floor;
walls = obj_example_genetic_B_wall;

// Create population
count = 50;
population = array_create(count);
var minPos = floors.bbox_left+8;
var maxPos = floors.bbox_right-8;
for(var i = 0; i < count; i++) {
	var xx = random_range(minPos, maxPos);
	population[@i] = instance_create_depth(xx, floors.bbox_top, -2, specimens);
}

