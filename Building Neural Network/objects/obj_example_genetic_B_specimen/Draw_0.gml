/// @desc DRAW SELF

// Animate
image_index = (vspd > 1);
if (x != xprevious) {
	image_xscale = sign(x-xprevious);
}

// Draw
draw_self();
