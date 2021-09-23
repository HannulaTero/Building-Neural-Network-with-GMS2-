
/*

	Genetic Algorithm happens in three steps:
	 1. Selection		Sort population by fitness.
	 2. Cross-over		Make offsprings from elites.
	 3. Mutation		Change parameters randomly.
	How you actually execute these aren't written in stone
	 
	We assume following things
	 - Population is array of any struct or instances: specimens
	 - Specimen should have variables: 
		-> nn			{network}		Same architecture with whole population.
		-> fitness		{real}			Tells performance

	Fitness is way for evaluating performance of specimen.
	 - Fitness-scoring is calculated during the round.
	 - At end of round, population is sorted by their fitness.
	 - Sorted specimens are in best-to-worst order.
	 - Choosing elite is taking portion of list from best-end.
	
	Defining how fitness is calculated can be hardest part 
	 - Because it is task-specific, we can't have single function
	 - Think how to align scoring to wanted behaviour
	 - Think how to encourage long-term behaviour

*/

/// @func	neural_genetic_selection(population);
/// @desc	Sorts population by their fitness-scoring, assumes higher score is better.
/// @param	{array}		population		Array of structs/instances.
function neural_genetic_selection(population) {
	array_sort(population, function(A, B) {
		return B.fitness - A.fitness;
	});
}

/// @func	neural_genetic_crossover(population, elitism);
/// @desc	Makes offsprings from chosen elite.  Portion is given as relative value.
/// @param	{array}		population		Array of structs/instances.
/// @param	{real}		elitism			[0-1] What portion are considered as elites
function neural_genetic_crossover(population, elitism) {
	// Portion considered as elite
	var count = array_length(population);
	var eliteCount = max(1, ceil(count * elitism));
	
	// Replace rest of population with offsprings of elite. 
	for(var c = eliteCount; c < count; c++) {
		var parentA = population[irandom(eliteCount-1)].nn.layers;
		var parentB = population[irandom(eliteCount-1)].nn.layers;
		var child = population[c].nn.layers;
		
		// Crossover from the parents
		var size = population[c].nn.size;
		for(var i = 1; i < size; i++) {
			neural_genetic_layer_crossover(child[i], parentA[i], parentB[i]);
		}
	}
}

/// @func	neural_genetic_mutate(population, start, stop, amount, rate);
/// @desc	Mutates given portion of population. Portion is given as relative values.
/// @param	{array}		population		Array of structs/instances. 
/// @param	{real}		start			[0-1] Start position of portion
/// @param	{real}		stop			[0-1] End position of portion
/// @param	{real}		amount			[0-1] Amount of mutations layer will have
/// @param	{real}		rate			How large the mutations can be
function neural_genetic_mutate(population, start, stop, amount, rate) {
	var count = array_length(population);
		start = floor(start*count);
		stop = ceil(stop*count);
	for(var c = start; c < stop; c++) {
		var target = population[c].nn.layers;
		var size = population[c].nn.size;
		for(var i = 1; i < size; i++) {
			neural_genetic_layer_mutate(target[i], amount, rate);
		}
	}
}







