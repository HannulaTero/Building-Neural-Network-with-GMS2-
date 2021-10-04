/// @desc GENETIC ALGORITHM
floors.image_xscale -= .1/60;

// When all have died, find who performed best
if (instance_number(specimens) == 0) {
	// Genetic Algorithm
	neural_genetic_selection(population);
	neural_genetic_crossover(population, .1);
	neural_genetic_mutate(population, .1, 1, .2, .2);
	generation++;
	best = max(best, time);
	time = 0;
		
	// Restart and start with new generation
	floors.image_xscale = 9;
	instance_destroy(walls);
	instance_activate_object(specimens);
	with(specimens) {
		Restart();
	}
}
