#include "colors.inc"   
#include "functions.inc"  
#include "stones.inc" // pre-defined scene elements
#include "textures.inc" // pre-defined scene elements
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"
camera {
location <0, -60, 35>*1.1
look_at 0
angle 30
}
background { color White } // to make the torus easy to see
light_source { <15, 15, 50> White }
   


#declare Blob_threshold=0.5;
#declare L=isosurface {
function {
(1+Blob_threshold)
-pow(Blob_threshold, pow(sqrt(pow(x,2) + pow(y,2))-3,2) + pow(z,2)-2)
-pow(Blob_threshold, pow(sqrt(pow(x+7,2) + pow(y,2))-3,2) + pow(z,2) - 2) 
-pow(Blob_threshold, pow(sqrt(pow(x+14,2) + pow(y,2))-3,2) + pow(z,2) - 2)
-pow(Blob_threshold, pow(sqrt(pow(x-7,2) + pow(y,2))-3,2) + pow(z,2) - 2)
-pow(Blob_threshold, pow(sqrt(pow(x-14,2) + pow(y,2))-3,2) + pow(z,2) - 2)   
-pow(Blob_threshold, pow(sqrt(pow(x+21,2) + pow(y,2))-3,2) + pow(z,2) - 2)
-pow(Blob_threshold, pow(sqrt(pow(x-21,2) + pow(y,2))-3,2) + pow(z,2) - 2)
}
max_gradient 4
contained_by { box { -23, 23 } }
}   

#declare f=
  object{L texture{pigment{color rgb <2, 2, 1.2>} finish {
ambient .1
diffuse .4
specular 1
}}}  
  
f