#version 300 es

precision highp float;

layout(location = 0) in vec2 vert_position;
out vec2 map_position;

uniform float depth;
uniform vec2 position;
uniform vec2 scale;
uniform vec2 spread;

void main(void) {
	map_position = vert_position * (scale + spread);
	gl_Position = vec4(map_position + position, depth, 1.0);
}
