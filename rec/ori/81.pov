#include "colors.inc"   
#include "functions.inc"  
#include "stones.inc" // pre-defined scene elements
#include "textures.inc" // pre-defined scene elements
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"
camera {
location <0, 10, 35>*1
look_at 0
angle 30
}
background { color White } // to make the torus easy to see
light_source { <0, 25, 50> White }
   


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
contained_by { box { -15, 15 } }
}   

#declare f=
  object{L texture{pigment{color rgb <1.5, 0.7, 0>} finish {
ambient .1
diffuse .4 
specular 0.4
}}rotate 90*x}   

#declare f1=
difference {
object{f}
box { <-20, -5, -10> < 20,  0,  10>  texture{pigment{color rgbt <0, 0, 0,1>}}}
cutaway_textures
} 

#declare f2=
difference {
object{f}
box { <-20, 0, -10> < 20,  5,  10>  texture{pigment{color rgbt <0, 0, 0,1>}}}}      

#declare f3=
intersection {
object{f}
box { <-20, -0.5, -10> < 20,  0.5, 10>  texture{pigment{color rgbt <0, 0, 0,1>}}}

}
                            
object{f1 translate 3*y}  
object{f2 translate -4*y} 
f3







