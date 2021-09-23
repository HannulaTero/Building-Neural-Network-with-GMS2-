/// @desc DRAW INFORMATION

// Draw information
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, 32, "Generation : " + string(generation));
draw_text(x, 64, "Alive : " + string(count-dead) + " / " + string(count));
draw_text(x, 96, "Level : " + string(level));
draw_text(x, 128, "Best : " + string(best));


// Show network of living specimen
if (keyboard_check(ord("Z"))) {
	var index = 0;
	var specimen;
	do { specimen = population[++index];
	} until ((specimen.alive) || (index >= count-1))
	
	specimen.nn.Draw(128, y, .75, 48, 16);
	draw_circle(specimen.x-1, specimen.y-3, 16, true);
}

