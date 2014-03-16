#version 150 core
layout (triangles) in;
layout (triangle_strip,  max_vertices=9) out;


in vec3 vertex_to_light_vector[3];
in vec3 normal[3];

out vec3 normalFrag;
out vec3 vertex_to_light_vectorFrag;

void main() {
        float x = 0.0;
        float y = 0.0;
        float z = 0.0;
    gl_Position = gl_in[0].gl_Position + vec4(x,y,z,0.0);
        vertex_to_light_vectorFrag = vertex_to_light_vector[0];
        normalFrag = normal[0];
    EmitVertex();

    gl_Position = gl_in[1].gl_Position + vec4(x,y,z,0.0);
        vertex_to_light_vectorFrag = vertex_to_light_vector[1];
        normalFrag = normal[1];
    EmitVertex();

    gl_Position = gl_in[2].gl_Position + vec4(x,y,z,0.0);
        vertex_to_light_vectorFrag = vertex_to_light_vector[2];
        normalFrag = normal[2];
    EmitVertex();
    EndPrimitive();

        x = 1.0;
        y = 1.4;
        z = 0.0;
    gl_Position = gl_in[0].gl_Position + vec4(x,y,z,0.0);
        vertex_to_light_vectorFrag = vertex_to_light_vector[0];
        normalFrag = normal[0];
    EmitVertex();

    gl_Position = gl_in[1].gl_Position + vec4(x,y,z,0.0);
        vertex_to_light_vectorFrag = vertex_to_light_vector[1];
        normalFrag = normal[1];
    EmitVertex();

    gl_Position = gl_in[2].gl_Position + vec4(x,y,z,0.0);
        vertex_to_light_vectorFrag = vertex_to_light_vector[2];
        normalFrag = normal[2];
    EmitVertex();
    EndPrimitive();

        x = -1.0;
        y = 1.4;
        z = 0.0;
    gl_Position = gl_in[0].gl_Position + vec4(x,y,z,0.0);
        vertex_to_light_vectorFrag = vertex_to_light_vector[0];
        normalFrag = normal[0];
    EmitVertex();

    gl_Position = gl_in[1].gl_Position + vec4(x,y,z,0.0);
        vertex_to_light_vectorFrag = vertex_to_light_vector[1];
        normalFrag = normal[1];
    EmitVertex();

    gl_Position = gl_in[2].gl_Position + vec4(x,y,z,0.0);
        vertex_to_light_vectorFrag = vertex_to_light_vector[2];
        normalFrag = normal[2];
    EmitVertex();
    EndPrimitive();
}
