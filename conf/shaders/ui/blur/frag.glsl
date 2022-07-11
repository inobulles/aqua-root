#version 300 es

precision highp float;

in vec2 interp_position;
out vec4 frag_colour;

uniform float alpha;
uniform sampler2D sampler;

uniform vec2 res;

// implementation of the simple Kawase blur
// you can disable/enable an approximation of gamma correction (where gamma = 2 instead of 2.2) by commenting/uncommenting this line

#define GAMMA 2.0

void kawase_sample(in vec2 coords, inout vec3 colour) {
	vec3 sample_ = texture(sampler, coords).rgb;

	// we can't use an asignment operator here for reasons I'm unsure about, at least on NVIDIA

#if defined(GAMMA)
	colour.r = colour.r + pow(sample_.r, GAMMA);
	colour.g = colour.g + pow(sample_.g, GAMMA);
	colour.b = colour.b + pow(sample_.b, GAMMA);
#else
	colour = colour + sample_;
#endif
}

void main(void) {
	vec2 uv = interp_position + vec2(0.5);
	float i = 3.0;

	uv.y = 1.0 - uv.y;

	vec3 colour = vec3(0.0);
	float EXTENSION = 10.0;

	for (float j = 1.0; j < EXTENSION + 1.0; j++) {
		kawase_sample(uv + (vec2( i,  i) * j + vec2( 0.5,  0.5)) / res, colour);
		kawase_sample(uv + (vec2( i, -i) * j + vec2( 0.5, -0.5)) / res, colour);
		kawase_sample(uv + (vec2(-i,  i) * j + vec2(-0.5,  0.5)) / res, colour);
		kawase_sample(uv + (vec2(-i, -i) * j + vec2(-0.5, -0.5)) / res, colour);
	}

	colour /= 4.0 * EXTENSION;

#if defined(GAMMA)
	colour.r = pow(colour.r, 1.0 / GAMMA);
	colour.g = pow(colour.g, 1.0 / GAMMA);
	colour.b = pow(colour.b, 1.0 / GAMMA);
#endif

	frag_colour = vec4(colour, alpha);
}
