/// @desc 

if (keyboard_check_pressed(vk_space)) {
	var time = get_timer();
	nn.Forward();
	show_debug_message(get_timer()-time);
}