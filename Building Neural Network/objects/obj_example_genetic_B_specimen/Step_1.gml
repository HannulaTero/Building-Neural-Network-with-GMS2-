/// @desc FITNESS-FUNCTION

// Evaluate fitness
fitness += 10;			// Just trying to be alive as long as can.
fitness -= max(0,vspd);	// Punish being in the air -> try stay on ground.

// Out of the game.
if (y > room_height) // Fell down.
|| (collision_point(x, y, obj_example_genetic_B_wall, true, true) != noone) {
	instance_deactivate_object(self);
}