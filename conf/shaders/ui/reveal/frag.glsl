#version 300 es

precision highp float;

in vec2 interp_position;
out vec4 frag_colour;

uniform float alpha;

uniform vec2 radius;
uniform vec2 mouse;
uniform vec4 colour;

void main(void) {
	vec2 vector = mouse * 2. - 1. - interp_position;
	
	float dx = vector.x / radius.x;
	float dy = vector.y / radius.y;

	float value = 1. - clamp(length(vec2(dx, dy)), 0., 1.);
	frag_colour = /*vec4(0.7, 0.8, 1.0, 0.3)*/ colour * vec4(vec3(1.), value * value * alpha);
}
