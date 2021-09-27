/// @desc PLAY THE GAME

// Touching floor
var ground = obj_example_genetic_floor.bbox_top;

// Platforming
y += vspd;
vspd += .6;
if (y > ground) {
	y = ground;	// Don't sink into floor
	vspd = button ? -12 : 0; // Jump
}

// Jump height control
if (!button)
&& (vspd < 0) {
	vspd /= 2;
}		

