#version 300 es

precision highp float;

in vec2 interp_position;
out vec4 frag_colour;

uniform float alpha;
uniform sampler2D sampler;

void main(void) {
	vec4 colour = texture(sampler, interp_position + vec2(0.5));
	colour.rgb /= colour.a; // undo alpha premultiplication

	frag_colour = vec4(colour.bgr, alpha * colour.a);
}
