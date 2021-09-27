/// @desc UNLIMIT FPS
if (keyboard_check_pressed(vk_space)) {
	room_speed = (room_speed==60) ? 999 : 60;
}
