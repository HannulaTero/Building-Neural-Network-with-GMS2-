/// @desc CREATE OBSTACLES

time++;
if (time > 60) {	
	var xx = room_width + 64; // Come from right.
	var yy = y * random_range(.8, 1.1);
	instance_create_depth(xx, yy, 0, obj_example_genetic_wall);
	
	best = max(best, level++);
	time = 0;
}
