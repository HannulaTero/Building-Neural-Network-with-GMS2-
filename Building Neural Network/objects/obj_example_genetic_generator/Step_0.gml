/// @desc GENERATE OBSTACLE
time--;
if (time <= 0) {
	time = random_range(40,80);
	var xx = room_width + 64;
	var yy = obj_example_genetic_floor.bbox_top - random(32);
	instance_create_depth(xx, yy, 0, obj_example_genetic_wall);
}