/// @desc SAVE / LOAD TEST
if (!keyboard_check(vk_control)) exit; 

// STRINGIFY to CLIPBOARD
if (keyboard_check_pressed(ord("C"))) {
	var specimen = population[0]; // Latest best
	var json = neural_model_stringify(specimen.nn);
	clipboard_set_text(json);
	show_message("Stringified");
}

// PARSE from CLIPBOARD
if (keyboard_check_pressed(ord("V"))) {
	var json = clipboard_get_text();
	var network = neural_model_parse(json);
	
	// Check whether parsing failed
	if (is_undefined(network)) {
		show_message("Parsing failed :(");
	}
	
	// Succeeded - copy parameters to whole population
	if (!is_undefined(network)) {
		for(var i = 0; i < count; i++) {
			neural_model_copy(population[i].nn, network);
		}
		show_message("Parsing succeeded! Copied to population.");
	}
}

// SAVE NETWORK INTO FILE
if (keyboard_check_pressed(ord("S"))) {
	var specimen = population[0]; 
	var buffer = neural_model_save(specimen.nn);
	var file = get_save_filename("network|*.sav", "Specimen");
	if (file != "") {
		buffer_save(buffer, file);
		show_message("Network was saved!");
	} else {
		show_message("Saving was cancelled");
	}
	buffer_delete(buffer);
}

// LOAD NETWORK FROM FILE
if (keyboard_check_pressed(ord("O"))) {
	// Try loading network
	var file = get_open_filename("network|*.sav", "Specimen");
	var buffer = buffer_load(file);
	var network = neural_model_load(buffer);
	buffer_delete(buffer);
	
	// Check whether laoding failed
	if (is_undefined(network)) {
		show_message("Loading failed :'(");
	}
	
	// Succeeded - copy parameters to whole population
	if (!is_undefined(network)) {
		for(var i = 0; i < count; i++) {
			neural_model_copy(population[i].nn, network);
		}
		show_message("Loading was successful! Copied to population.");
	}
}




















