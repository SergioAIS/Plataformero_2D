//Input
if (keyboard_check(vk_right))
{
	if (xSpeed < xSpeedMax) xSpeed += xAccel
}

if (keyboard_check(vk_left))
{
	if (xSpeed > -xSpeedMax) xSpeed -= xAccel
}

if (keyboard_check(vk_right) and keyboard_check(vk_left)) xSpeed = 0
if (!keyboard_check(vk_right) and !keyboard_check(vk_left)) xSpeed = 0

//Movimiento
if (xSpeed != 0)
{
	if (xSpeed > 0)
	{
		move_contact_solid(0, xSpeed)
	}
	else
	{
		move_contact_solid(180, abs(xSpeed))
	}
}

if (ySpeed != 0)
{
	if (ySpeed > 0)
	{
		move_contact_solid(270, ySpeed)
	}
	else
	{
		move_contact_solid(90, abs(ySpeed))
	}
}

//Checks
if (!place_free(x, y + 1)) 
{
	ground = 1
	ySpeed = 0
}
else
{
	ground = 0
	ySpeed += grav
}
