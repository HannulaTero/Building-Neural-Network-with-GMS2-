/// @desc DRAW SELF

// Animate
image_index = abs(vspd > 1);

// Death animation
if (!alive) {
	vspeed += .6;
	image_angle += 10;
}

// Draw specimen
draw_self();
