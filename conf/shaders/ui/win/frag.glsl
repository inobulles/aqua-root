#version 300 es
#extension GL_OES_EGL_image_external : require

precision highp float;

in vec2 interp_position;
out vec4 frag_colour;

uniform float alpha;
uniform samplerExternalOES sampler;

void main(void) {
	vec4 colour = texture2D(sampler, interp_position + vec2(0.5));
	colour.rgb /= colour.a; // undo alpha premultiplication

	frag_colour = vec4(colour.rgb, alpha * colour.a);
}
