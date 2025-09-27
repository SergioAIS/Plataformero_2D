//Input
if (keyboard_check(vk_right))
{
	if (xSpeed < 0) xSpeed = 0
	if (xSpeed < xSpeedMax) xSpeed += xAccel
	right = 1
}

if (keyboard_check(vk_left))
{
	if (xSpeed > 0) xSpeed = 0
	if (xSpeed > -xSpeedMax) xSpeed -= xAccel
	right = 0
}

if (keyboard_check(vk_right) and keyboard_check(vk_left)) xSpeed = 0
if (!keyboard_check(vk_right) and !keyboard_check(vk_left)) xSpeed = 0

//Salto
if (keyboard_check_pressed(vk_alt))
{
	if (ground == 1)
	{
		ySpeed = -jumpPower	
		ground = 0
	}
}

if (keyboard_check_released(vk_alt))
{
	if (ySpeed < 0) ySpeed = 0	
}

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
	if (ySpeed > fallMax) ySpeed = fallMax
	
	if (!place_free(x, y - 1)) 
	{
		if (ySpeed < 0) ySpeed = 0
	}
}
