#include "colors.inc"   
#include "functions.inc"  
#include "stones.inc" // pre-defined scene elements
#include "textures.inc" // pre-defined scene elements
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"
camera {
location <30, 40, -80>
look_at 0
angle 30
}
background { color White } // to make the torus easy to see
light_source { <5, 15, -50> White }

#declare b=5.1;
#declare c=5.8; 

#declare first1=parametric {
  function { 6*cos(u)*(1 + sin(u)) + 4*(1 - cos(u)/2)*cos(u)*cos(v) },          
  function { 16*sin(u) + 4*(1 - cos(u)/2)*sin(u)*cos(v)  },                   
  function { 4*(1 - cos(u)/2)*sin(v) }             
  <0,0>, <pi,pi>              
  contained_by { box { <-20,-20,-20>, <20,20,20> } }
  accuracy 0.005        
  precompute 15 x,y,z   
}   

#declare second1=parametric {
  function { 6*cos(u)*(1 + sin(u)) + 4*(1 - cos(u)/2)*cos(v+pi) },          
  function {  16*sin(u)  },                   
  function {  4*(1 - cos(u)/2)*sin(v) }             
  <pi,0>, <2*pi,pi>              
  contained_by { box { <-20,-20,-20>, <20,20,20> } }
  accuracy 0.005        
  precompute 15 x,y,z   
}  
  


#declare bottle1=union{
object{first1}
object{second1}
}

#declare a1=object{bottle1  //color naranja <4,2,1> o parecido...
  texture{pigment{color rgb <1,2,2>} finish {   //<1,1.3,2> el azul eléctrico
ambient .1
diffuse .4
specular 1
}}
rotate 180*x 
translate -b*z
translate -c*x
}
  
#declare first2=parametric {
  function { 6*cos(u)*(1 + sin(u)) + 4*(1 - cos(u)/2)*cos(u)*cos(v) },          
  function { 16*sin(u) + 4*(1 - cos(u)/2)*sin(u)*cos(v)  },                   
  function { 4*(1 - cos(u)/2)*sin(v) }             
  <0,pi>, <pi,2*pi>              
  contained_by { box { <-20,-20,-20>, <20,20,20> } }
  accuracy 0.001        
  precompute 15 x,y,z   
}   

#declare second2=parametric {
  function { 6*cos(u)*(1 + sin(u)) + 4*(1 - cos(u)/2)*cos(v+pi) },          
  function {  16*sin(u)  },                   
  function {  4*(1 - cos(u)/2)*sin(v) }             
  <pi,pi>, <2*pi,2*pi>              
  contained_by { box { <-20,-20,-20>, <20,20,20> } }
  accuracy 0.001        
  precompute 15 x,y,z   
}  
  


#declare bottle2=union{
object{first2}
object{second2}
}

#declare a2=object{bottle2  //color naranja <4,2,1> o parecido...
  texture{pigment{color rgb <1,2,2>} finish {   //<1,1.3,2> el azul eléctrico
ambient .1
diffuse .4
specular 1
}}
rotate 180*x 
translate b*z 
translate c*x
} 

a1
a2