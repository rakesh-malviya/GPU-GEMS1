uniform float timerCount;
varying vec3 normal;
varying vec3 vertex_to_light_vector;
varying vec4 position;
varying vec3 tempNormal;

void main()
{
    // Transforming The Vertex
    position = gl_Vertex;
    float time = 3;
    float Q = 0.7;
    float A = 0.1;
    float B = 2*3.14159*3;
    float C = 2*3.14159/time;
    float Ci = 2*3.14159/(time/3);
    float D = sqrt(position.x*position.x + position.y*position.y);
    float angle = B*D + timerCount*C;
    float anglei = B*D + timerCount*Ci;
    float Qi = Q/(B*A);

    position.z = A*sin(angle);
    //position.z = 2*A*pow(((sin(angle)+1)/2),3);
    position.x = position.x + Qi*A*position.x*cos(anglei);
    position.y = position.y + Qi*A*position.y*cos(anglei);

    gl_Position = gl_ModelViewProjectionMatrix * position;

    tempNormal = gl_Normal;
    tempNormal.x = -A*B*position.x*cos(angle);
    tempNormal.y = -A*B*position.y*cos(angle);
    tempNormal.z = 1 - Qi*A*B*sin(angle);
//    tempNormal.x = (A*B*position.x/D)*cos(angle);
//    tempNormal.y = (A*B*position.y/D)*cos(angle);
//    tempNormal.x = (A*B*position.x/D)*cos(angle)*((sin(angle)+1)/2)*((sin(angle)+1)/2);
//    tempNormal.y = (A*B*position.y/D)*cos(angle)*((sin(angle)+1)/2)*((sin(angle)+1)/2);


    // Transforming The Normal To ModelView-Space
    normal = gl_NormalMatrix * tempNormal;

    // Transforming The Vertex Position To ModelView-Space
    vec4 vertex_in_modelview_space = gl_ModelViewMatrix * gl_Vertex;

    // Calculating The Vector From The Vertex Position To The Light Position
    vertex_to_light_vector = vec3(vertex_in_modelview_space - gl_LightSource[0].position);
}
