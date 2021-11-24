#version 300 es

precision highp float;

in vec2 interp_position;
out vec4 frag_colour;

uniform float alpha;
uniform sampler2D sampler;

uniform vec4 theme_fg;
uniform vec4 theme_bg;

void main(void) {
	vec4 colour = texture(sampler, interp_position + vec2(0.5));
	colour.rgb /= colour.a; // undo alpha premultiplication

	float fg = colour.b;
	float bg = colour.g;

	vec4 themed_colour = theme_fg * fg + theme_bg * bg;
	frag_colour = vec4(themed_colour.bgr, alpha * themed_colour.a * colour.a);
}
