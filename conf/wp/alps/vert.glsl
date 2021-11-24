#version 300 es

precision highp float;

layout(location = 0) in vec3 position;
layout(location = 1) in vec2 tex_coords;

out vec2 interp_tex_coords;

uniform mat4 matrix;

void main(void) {
	interp_tex_coords = tex_coords;
	gl_Position = matrix * vec4(position, 1.0);
}
