#version 300 es

precision highp float;

in vec2 interp_position;
out vec4 frag_colour;

uniform float alpha;
uniform sampler2D sampler;

uniform vec2 res;

// implementation of the simple Kawase blur

void main(void) {
	vec2 uv = interp_position + vec2(0.5);
	float i = 2.0;

	vec3 colour = vec3(0.0);
	float EXTENSION = 2.0;

	for (float j = 1.0; j < EXTENSION + 1.0; j++) {
		colour += texture(sampler, uv + (vec2( i,  i) * j + vec2( 0.5,  0.5)) / res).rgb;
		colour += texture(sampler, uv + (vec2( i, -i) * j + vec2( 0.5, -0.5)) / res).rgb;
		colour += texture(sampler, uv + (vec2(-i,  i) * j + vec2(-0.5,  0.5)) / res).rgb;
		colour += texture(sampler, uv + (vec2(-i, -i) * j + vec2(-0.5, -0.5)) / res).rgb;
	}

	colour /= 4.0 * EXTENSION;
	frag_colour = vec4(colour, alpha);
}
