/// @desc LOAD / SAVE TEST
if (keyboard_check_pressed(vk_numpad0)) {
	var json = neural_model_stringify(population[0].nn);
	clipboard_set_text(json);
}

if (keyboard_check_pressed(vk_numpad1)) {
	var json = clipboard_get_text();
	var nn = neural_model_parse(json);
	for(var i = 0; i < count; i++) {
		population[i].nn.Destroy();
		population[i].nn = neural_model_clone(nn);
	}
}

if (keyboard_check_pressed(vk_numpad2)) {
	var buffer = neural_model_save(population[0].nn);
	var file = get_save_filename("network|*.sav", "Specimen");
	buffer_save(buffer, file);
	buffer_delete(buffer);
}

if (keyboard_check_pressed(vk_numpad3)) {
	var file = get_open_filename("network|*.sav", "Specimen");
	var buffer = buffer_load(file);
	var nn = neural_model_load(buffer);
	buffer_delete(buffer);
	for(var i = 0; i < count; i++) {
		population[i].nn.Destroy();
		population[i].nn = neural_model_clone(nn);
	}
}

