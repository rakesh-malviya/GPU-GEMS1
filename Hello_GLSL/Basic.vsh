uniform float timerCount;
varying vec3 normal;
varying vec3 vertex_to_light_vector;
varying vec4 position;
varying vec3 tempNormal;

void main()
{
    // Transforming The Vertex
    position = gl_Vertex;
    float A = 0.1;
    float B = 2*3.14159*3;
    float C = 2*3.14159/1.0;
    float D = sqrt(position.x*position.x + position.y*position.y);
    float angle = B*D + timerCount*C;
    //position.z = A*sin(angle);
    position.z = 2*A*pow(((sin(angle)+1)/2),3);

    gl_Position = gl_ModelViewProjectionMatrix * position;

    tempNormal = gl_Normal;
//    tempNormal.x = (A*B*position.x/D)*cos(angle);
//    tempNormal.y = (A*B*position.y/D)*cos(angle);
    tempNormal.x = (A*B*position.x/D)*cos(angle)*((sin(angle)+1)/2)*((sin(angle)+1)/2);
    tempNormal.y = (A*B*position.y/D)*cos(angle)*((sin(angle)+1)/2)*((sin(angle)+1)/2);


    // Transforming The Normal To ModelView-Space
    normal = gl_NormalMatrix * tempNormal;

    // Transforming The Vertex Position To ModelView-Space
    vec4 vertex_in_modelview_space = gl_ModelViewMatrix * gl_Vertex;

    // Calculating The Vector From The Vertex Position To The Light Position
    vertex_to_light_vector = vec3(vertex_in_modelview_space - gl_LightSource[0].position);
}
