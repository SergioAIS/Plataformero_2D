// Destruirse si sale de la habitación para no consumir memoria
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}