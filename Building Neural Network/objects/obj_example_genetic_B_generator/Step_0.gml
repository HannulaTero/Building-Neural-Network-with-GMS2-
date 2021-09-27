/// @desc GENERATE OBSTACLE
time--;
if (time <= 0) {
	time = random_range(40,80);
	
	var xx, yy;
	if (choose(true, false)) {
		xx = choose(-64, room_width+64);
		yy = random_range(-64, room_height+64);
	} else {
		xx = random_range(-64, room_width+64);
		yy = choose(-64, room_height+64);
	}
	
	instance_create_depth(xx, yy, 0, obj_example_genetic_B_wall);
}