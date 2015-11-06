#include "colors.inc"   
#include "functions.inc"  
#include "stones.inc" 
#include "textures.inc" 
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"    

camera {
location <4, 3, 5> 
look_at <1, 0,0> 
angle 0
}
background { color White } 
light_source { <-3, 5, 4> White }

#declare a=difference{
cylinder {
  <0, -0.5,0>,  <0, 0.5,0>,  2 
  open  translate (sqrt(15)/2)*x
  texture{pigment{color rgb <2, 3,5>}
  finish {ambient .1 diffuse .4 specular 1} 
} 

}
box {
  <-1, -1, -0.5> 
  < 1,  1,  0.5>  
}texture{pigment{color rgbt <0, 0,0,1>} 
}}

#declare b=difference{
cylinder {
  <0, -0.5,0>,  <0, 0.5,0>,  2 
  open  rotate 90*x translate -(sqrt(15)/2)*x
  texture{pigment{color rgb <2, 3,5>} 
  finish {ambient .1 diffuse .4 specular 1} 
}
}
box {
  <-1, -0.5, -0.5>  
  < 1,  0.5,  0.5>  
}texture{pigment{color rgbt <0, 0,0,1>}
}}

box {
  <-0.01, -0.5, -0.5>  
  < 0.01,  0.5,  0.5>  
  texture{pigment{color rgb <2, 3,5>}
  finish {ambient .1 diffuse .4 specular 1} 
}
}

a
b

