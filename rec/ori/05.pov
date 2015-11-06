#include "colors.inc"   
#include "functions.inc"  
#include "stones.inc" // pre-defined scene elements
#include "textures.inc" // pre-defined scene elements
#include "shapes.inc"
#include "glass.inc"
#include "metals.inc"
#include "woods.inc"
camera {
location <4, 3, 5> //antes y siempre <0, -7, 5> //<4, 3, 5> //<7, 3, 1>
look_at <2.5, 0,0> //<1, 0,0>
angle 0
}
background { color White } // to make the torus easy to see
light_source { <-3, 5, 4> White }//<3, 5, 4> //<-3, 5, 4>//<7, 3, 4>



parametric {
  function { 2*cos(u) },  //function { (2+v*sin(0.54374*u-7.87337/180*pi))*cos(u) },          // x-axis
  function { v },  //function { v*cos(0.54374*u-7.87337/180*pi) },                        // y-axis
  function { 2*sin(u) } // function { (2+v*sin(0.54374*u-7.87337/180*pi))*sin(u) }            // z-axis
  <0,-0.45>, <2*pi,0.45>  //-0.5,0.5  //<14.48/180*pi,-0.45>, <345.8/180*pi,0.45> 
  // contained_by { sphere { 0,1 } } // texturing problem, use box instead to see!
  contained_by { box { <-10,-10,-10>, <10,10,10> } }
  // max_gradient 2
  accuracy 0.005        // 0.001 default, lower slower but better
  precompute 15 x,y,z   // precompute [x,y,z] normally gives faster rendering (<=20)
  rotate 180*z
  translate (sqrt(15)/2)*x
  texture{pigment{color rgb <2, 3,3>}  //<2, 3,2>
  finish {ambient .1 diffuse .4 specular 1}
}
}





