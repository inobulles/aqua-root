#version 300 es

precision highp float;

out vec4 frag_colour;

uniform sampler2D sampler;

in vec2 interp_tex_coords;

void main(void) {
	frag_colour = texture(sampler, interp_tex_coords);
}
