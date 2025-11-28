if (invi == 0)
{
	hp -= other.dmg
	invi = invi_max
	
	obj = instance_create_layer(x, y, "part_front", o_float_text)
	obj.type = "att"
	obj.value = other.dmg
}