#version 300 es

precision highp float;

in vec2 interp_position;
out vec4 frag_colour;

uniform float alpha;
uniform sampler2D sampler;

uniform vec4 colour;

void main(void) {
	frag_colour = vec4(colour.rgb, alpha * colour.a);
}
