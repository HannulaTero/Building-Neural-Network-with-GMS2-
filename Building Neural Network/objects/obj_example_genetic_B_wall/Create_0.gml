/// @desc CREATION
image_blend		= make_color_rgb(204, 40, 139);
image_xscale	= random_range(.5, .9);
image_yscale	= random_range(.5, .9);
image_angle		= random(360);
depth			= -1;

// Get target position 
var ground = obj_example_genetic_floor; 
var xx = random_range(ground.bbox_left, ground.bbox_right);
var yy = ground.bbox_top;

// Move toward target position
direction = point_direction(x, y, xx, yy);
speed = random_range(4, 6);