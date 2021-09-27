/// @desc PLAY THE GAME

// Touching floor
var ground = collision_point(x, y, obj_example_genetic_floor, false, true);

// Platforming
if (ground != noone) {
	y = ground.bbox_top; // Don't sink into floor
	vspd = button ? -12 : 0; // Jump
}
y += vspd;
vspd += .6;

// Jump height control
if (!button)
&& (vspd < 0) {
	vspd /= 2;
}		

