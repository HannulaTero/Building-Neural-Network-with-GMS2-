/// @desc DRAW NETWORK + INFO

// Draw text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var text = training ? "Training in Progress." : "Not Training.";
	text += "\n" + "Latest error : " + string_format(nn.error*100, 3, 1);
draw_text(room_width/2, 64, text);

// Draw Network
var xx = room_width/2;
var yy = room_height/2;
var scale = 1;
var xspacing = 64;
var yspacing = 32;
nn.Draw(xx, yy, scale, xspacing, yspacing);

// Draw Example input/output
var offset = (nn.size/2) * xspacing;
DrawArray(input, xx-offset, yy, scale, xspacing, yspacing);
DrawArray(output, xx+offset, yy, scale, xspacing, yspacing);

draw_set_valign(fa_middle);
draw_set_halign(fa_right);
draw_text(xx-offset-xspacing, yy-yspacing/2, "Example Input");
draw_set_halign(fa_left);
draw_text(xx+offset-xspacing*0, yy-yspacing/2, "Example Output");
