precision mediump float;

attribute vec3 vPosition;
attribute vec3 vColor;
attribute vec3 vNormal;

varying vec3 fColor;
varying vec3 fPosition;
varying vec3 fNormal;

uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;

uniform mat3 normalMatrix;

uniform float scale;
uniform float tengah;
uniform vec3 memantul;

void main() {
  mat4 to_origin = mat4(
    1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, -2.0, 1.0 
  );

  mat4 memantul = mat4(
    1.0, 0.0, 0.0, memantul.x,
    0.0, 1.0, 0.0, memantul.y,
    0.0, 0.0, 1.0, memantul.z,
    0.0, 0.0, 0.0, 1.0
  );

  vec4 vectengah = vec4(tengah,0,0,1.0);

  mat4 skalasi = mat4(
    scale, 0.0, 0.0, -(vectengah.x)*scale + (vectengah.x),
    0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0,
    0.0, 0.0, 0.0, 1.0
  );

  gl_Position = projection * view * model * vec4(vPosition, 1.0);

  fColor = vColor;
  fPosition = vec3(view * model * vec4(vPosition, 1.0));
  fNormal = normalMatrix * vNormal;
}
