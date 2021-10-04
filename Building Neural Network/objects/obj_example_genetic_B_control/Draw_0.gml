/// @desc INFORMATION
time++;

var xx = room_width/2;
var yy = 32;
var i = 1;
draw_text(xx, yy * i++, "Generation : " + string(generation));
draw_text(xx, yy * i++, "Alive : " + string(instance_number(specimens)));
draw_text(xx, yy * i++, "Time : " + string(time));
draw_text(xx, yy * i++, "Best : " + string(best));
draw_text(xx, yy * i++, "R to restart");
draw_text(xx, yy * i++, "Enter to load pre-trained specimen");