#include "colors.inc"   
#include "functions.inc"  
#include "stones.inc" // pre-defined scene elements
#include "textures.inc" // pre-defined scene elements
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"
camera {
location <0, -40, 20>
look_at 0
angle 30
}
background { color White } // to make the torus easy to see
light_source { <15, -30, 50> White }
   

#declare a=2.5;

#declare first=parametric {
  function {( 6*cos(u)*(1 + sin(u)) + 4*(1 - cos(u)/2)*cos(u)*cos(v) )/a},          
  function {( 16*sin(u) + 4*(1 - cos(u)/2)*sin(u)*cos(v))/a  },                   
  function {( 4*(1 - cos(u)/2)*sin(v))/a }             
  <0,0>, <pi,2*pi>              
  contained_by { box { <-20,-20,-20>, <20,20,20> } }
  accuracy 0.005        
  precompute 15 x,y,z   
}   

#declare second=parametric {
  function {( 6*cos(u)*(1 + sin(u)) + 4*(1 - cos(u)/2)*cos(v+pi))/a },          
  function {  (16*sin(u))/a  },                   
  function { ( 4*(1 - cos(u)/2)*sin(v) )/a}             
  <pi,0>, <2*pi,2*pi>              
  contained_by { box { <-20,-20,-20>, <20,20,20> } }
  accuracy 0.005        
  precompute 15 x,y,z   
}  
  


#declare bottle=union{
object{first}
object{second}
}

#declare g=object{bottle  
 texture{pigment{color rgb <1.2, 2, 1.2>} finish {
ambient .1
diffuse .4
specular 1  
}}     
rotate 270*x
}

  

object{g}