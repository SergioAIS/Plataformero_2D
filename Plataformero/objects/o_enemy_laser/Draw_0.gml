
draw_self();

if(hspeed == 0)
{
	if(instance_exists(tracer))
	{
		draw_set_color(c_red);
		draw_set_alpha(0.5);
		gpu_set_blendmode(bm_add);

		draw_line_width(x,y-32,tracer.x,tracer.y,1);
		
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);

	}
}
