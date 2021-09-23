/// @desc DRAW SPECIMEN INFORMATION

// Select specimen
if (device_mouse_check_button(0, mb_left)) {
	show = collision_circle(mouse_x, mouse_y, 16, obj_example_genetic_specimen, false, true);
}

// Draw target specimen information
with(show) {
	var input = nn.first.output;
	for(var i = 0; i < inputWall; i++) {
		var xx = x+lengthdir_x(input[i] * 256, view[i]);
		var yy = y+lengthdir_y(input[i] * 256, view[i]);
		draw_line(x, y, xx, yy);
	}
	nn.Draw(160, 140, .75, 48, 16);
}

