/// @desc FITNESS-FUNCTION
if (!alive) exit;

// Evaluate fitness
fitness += 10;			// Just trying to be alive as long as can.
fitness -= abs(vspd)/2;	// Punish being in the air -> try stay on ground.

// Dying is part of this Fitness-function
if (collision_point(x, y, obj_example_genetic_wall, true, true)) {
	obj_example_genetic_control.alive++;
	alive = false;
	
	// For death animation
	hspeed = +random_range(-3,3);
	vspeed = -random_range(5,9); 
}