#version 300 es

precision highp float;

in vec2 map_position;
out vec4 frag_colour;

uniform float alpha;
uniform vec2 scale;
uniform vec2 spread;
uniform vec4 colour;

void main(void) {
	// find distance from point on shadow plane to object bounds
	
	float dx = (2. * abs(map_position.x) - scale.x + spread.x / 8.) / spread.x;
	float dy = (2. * abs(map_position.y) - scale.y + spread.y / 8.) / spread.y;
	
	dx = clamp(dx, 0., 1.);
	dy = clamp(dy, 0., 1.);
	
	// calculate the shadow colour
	// we use a quadratic falloff for things to look nice and pretty
	
	float value = 1. - clamp(length(vec2(dx, dy)), 0., 1.);
	frag_colour = vec4(colour.rgb, alpha * colour.a * value * value);
}
