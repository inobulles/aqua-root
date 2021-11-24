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
	float i = 2.5; // fractionnal parts of .5 work best

	vec3 colour = vec3(0.0);

	colour += texture(sampler, uv + vec2( i,  i) / res).rgb;
	colour += texture(sampler, uv + vec2( i, -i) / res).rgb;
	colour += texture(sampler, uv + vec2(-i,  i) / res).rgb;
	colour += texture(sampler, uv + vec2(-i, -i) / res).rgb;

	colour /= 4.0;
	frag_colour = vec4(colour, alpha);
}
