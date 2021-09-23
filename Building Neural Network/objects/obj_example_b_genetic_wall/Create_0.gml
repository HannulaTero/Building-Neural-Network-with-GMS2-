/// @desc CREATE
image_blend = make_color_rgb(204, 40, 139);
image_xscale = random_range(.5, 1);
image_yscale = random_range(.5, 1);
image_angle = random(360);

var ground = obj_example_b_genetic_floor; 
var xx = random_range(ground.bbox_left, ground.bbox_right);
var yy = room_height/2;
var dir = point_direction(x, y, xx, yy);
var len = random_range(4, 6);
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);	