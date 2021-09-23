/// @desc DRAW INFORMATION

// Draw information
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, 32, "Generation : " + string(generation));
draw_text(x, 64, "Alive : " + string(alive) + " / " + string(count));
draw_text(x, 96, "Level : " + string(level));
draw_text(x, 128, "Best : " + string(best));
