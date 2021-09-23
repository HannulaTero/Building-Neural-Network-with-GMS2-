/// @desc DRAW

// Animate
image_index = (ground == noone);
if (x!=xprevious) {
	image_xscale = sign(x-xprevious);
}

// Death animation
if (!alive) {
	vspeed += .6;
	image_angle += 10;
}

// Draw specimen
draw_self();
