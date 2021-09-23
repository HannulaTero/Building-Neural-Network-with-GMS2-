/// @desc CREATE OBSTACLES

// Floor shrinks - eventually no floor: Force the end.
ground.scale = 1-level * .01;

// Obstacles
time++;
if (time > 60) {
	time = 0;
	level++;
	best = max(best, level);
	
	var xx, yy;
	if (choose(true,false)) {
		xx = choose(-64, room_width+64);
		yy = random_range(0, room_height);
	} else {
		xx = random_range(0, room_width);
		yy = choose(-64, room_height+64);
	}
	
	instance_create_depth(xx, yy, 0, obj_example_b_genetic_wall);
}
