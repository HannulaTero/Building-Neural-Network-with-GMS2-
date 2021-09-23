/// @desc PLAY THE GAME
if (!alive) exit;

// Touching floor
var ground = collision_point(x, y+10, obj_example_genetic_floor, false, true);

// Platforming
if (ground != noone) {
	y = ground.bbox_top;
	vspd = button ? -12 : 0;
}
y += vspd;
vspd += .6;

// Jump height control
if (!button)
&& (vspd < 0) {
	vspd /= 2;
}		

