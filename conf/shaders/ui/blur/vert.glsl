#version 300 es

precision highp float;

layout(location = 0) in vec2 vert_position;
out vec2 interp_position;

uniform float depth;
uniform vec2 position;
uniform vec2 scale;

void main(void) {
	interp_position = vert_position;
	gl_Position = vec4(vert_position * scale + position, depth, 1.0);
}
