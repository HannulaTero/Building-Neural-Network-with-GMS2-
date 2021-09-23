/// @desc GENETIC ALGORITHM

// When all have died, find who performed best
if (dead == count) {
	// Genetic algorithm
	neural_genetic_selection(population);				// Sort by fitness
	neural_genetic_crossover(population, .1);			// Crossover best ones
	neural_genetic_mutate(population, .3, 1, .2, .3);	// Mutate selected portion of population
		
	// Restart and start with new generation
	generation++;
	dead = 0;
	level = 0;
	ground.Restart();
	instance_destroy(obj_example_genetic_wall);
	for(var i = 0; i < count; i++) {
		population[i].Restart();
	}
}
