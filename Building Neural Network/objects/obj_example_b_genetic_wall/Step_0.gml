/// @desc PLAY THE GAME

x += hspd;
y += vspd;

var ss = 128;
if (x < -ss)
|| (y < -ss)
|| (x > room_width+ss) 
|| (y > room_height+ss) {
	instance_destroy();
}