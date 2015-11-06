 #version 3.7;  
 


#include "colors.inc"
#include "textures.inc" 
global_settings { assumed_gamma 2.2 }

background { color White}

#declare  klok=clock;//for 4D rotation
camera{  
        location <0,5,-15.9>
        look_at <0,0,0> 
        angle 35
       up y*image_height
         right x*image_width
        }
light_source {<10,10,-10> 
        color White
        spotlight
        radius 65
        falloff 20
        tightness 10
        point_at <0,0,0>
        }  
#declare  rot4d1=klok*360;  
#declare  rot4dangles= array[6] {0,0,rot4d1,0,0,0};       
#declare  thick=.08; 

#declare  rotx=0;
#declare  roty=10;
#declare  rotz=0;
        
# macro rotate4d(G2,G3,rot4dangles)
#local G2X=G2.x;#local G2Y=G2.y;
#local G3X=G3.x;#local G3Y=G3.y;
#local uu=0;  
# while (uu<6)
#if (uu=0) #declare RE=G2X; #declare IMA=G2Y; #end // ab
#if (uu=1) #declare RE=G2X; #declare IMA=G3X; #end // ac
#if (uu=2) #declare RE=G2X; #declare IMA=G3Y; #end // ad
#if (uu=3) #declare RE=G2Y; #declare IMA=G3X; #end // bc
#if (uu=4) #declare RE=G2Y; #declare IMA=G3Y; #end // bd
#if (uu=5) #declare RE=G3X; #declare IMA=G3Y; #end // cd
#local RE1 =Mult(<RE,IMA>,<cos(radians(rot4dangles[uu])),sin(radians(rot4dangles[uu]))>).x;
#local IMA1=Mult(<RE,IMA>,<cos(radians(rot4dangles[uu])),sin(radians(rot4dangles[uu]))>).y;
#if (uu=0) #declare G2X=RE1; #declare G2Y=IMA1; #end // ab
#if (uu=1) #declare G2X=RE1; #declare G3X=IMA1; #end // ac
#if (uu=2) #declare G2X=RE1; #declare G3Y=IMA1; #end // ad
#if (uu=3) #declare G2Y=RE1; #declare G3X=IMA1; #end // bc
#if (uu=4) #declare G2Y=RE1; #declare G3Y=IMA1; #end // bd
#if (uu=5) #declare G3X=RE1; #declare G3Y=IMA1; #end // cd 
#local uu=uu+1;
#end 
#local resG2=<G2X,G2Y>;#local resG3=<G3X,G3Y>;
#local result=array[2] {resG2,resG3};
result 
#end

//Complex Algebra
#macro Complex(X,Y) <X,Y> #end
#declare I=<0,1>;//Complex(0,1)
#macro Re(Z) Z.x #end
#macro Im(Z) Z.y #end                                                                   
#macro Conjugate(Z) <Z.x,-Z.y> #end
#macro Abs(Z) vlength(Z) #end // sqrt(square(Re(Z))+square(Im(Z)))
#macro Inv(Z) <Z.x/vdot(Z,Z),-Z.y/vdot(Z,Z)> #end 
#macro Arg(Z) atan2(Z.y,Z.x) #end
#macro Sqr(Z) <Z.x*Z.x-Z.y*Z.y,2*Z.x*Z.y> #end
#macro Pow(Z,n) #local r=vlength(Z); #if(r=0) #local z2=<0,0>; #else #local theta=n*atan2(Z.y,Z.x); #local z2=pow(r,n)*<cos(theta),sin(theta)>; #end z2 #end
#macro Exp(Z) exp(Z.x)*<cos(Z.y),sin(Z.y)> #end
#macro Sqrt(Z) #local r=vlength(Z); #if(r=0) #local z2=<0,0>; #else #local theta=.5*atan2(Z.y,Z.x); #local z2=pow(r,.5)*<cos(theta),sin(theta)>; #end z2 #end
#macro Mult(z1,z2) <z1.x*z2.x-z1.y*z2.y,z1.y*z2.x+z1.x*z2.y> #end
#macro Div(z1,z2) Mult(z1,<z2.x/vdot(z2,z2),-z2.y/vdot(z2,z2)>) #end  //Mult(z1,Pow(z2,-1)) 
#macro Comsin(Z) <sin(Re(Z))*cosh(Im(Z)),cos(Re(Z))*sinh(Im(Z))> #end
#macro Ln(Z) <ln(vlength(Z)),atan2(Im(Z),Re(Z))> #end 
#macro Acos(Z) <pi/2,0>+Mult(I,Ln(Mult(I,Z)+Pow(<1,0>-<Z.x*Z.x-Z.y*Z.y,2*Z.x*Z.y>,.5)  ) ) #end
#macro Asin(Z) -Mult(I,Ln( Mult(I,Z)+Pow(<1,0>-<Z.x*Z.x-Z.y*Z.y,2*Z.x*Z.y>,.5)  ) ) #end 

//-------------------
//Points on hypercube
#declare Punt=array[17]
#declare Punt_tel=0;
#declare a=.5;
#declare j1=-a;
#while (j1<a+1)
#declare j2=-a;
#while (j2<a+1)
#declare Punt_tel=Punt_tel+1;
#declare G2=<-a,-a>; #declare G3=<j2,j1>; #declare rot4dres=rotate4d(G2,G3,rot4dangles);#declare G2=rot4dres[0] ;#declare G3=rot4dres[1]; 
#declare Punt[Punt_tel]=<G3.x*2/(1+G2.x), G3.y*2/(1+G2.x),-G2.y*2/(1+G2.x)>; 
#debug concat ("#=",str(Punt_tel.x,3,0),"puntx=",str(Punt[Punt_tel].x,3,3),"punty=",str(Punt[Punt_tel].y,3,3),"puntz=",str(Punt[Punt_tel].z,3,3),"\n")
#declare Punt_tel=Punt_tel+1;  
#declare G2=<-a,a>; #declare G3=<j2,j1>; #declare rot4dres=rotate4d(G2,G3,rot4dangles);#declare G2=rot4dres[0] ;#declare G3=rot4dres[1]; 
#declare Punt[Punt_tel]=<G3.x*2/(1+G2.x), G3.y*2/(1+G2.x),-G2.y*2/(1+G2.x)>; 
#debug concat ("#=",str(Punt_tel.x,3,0),"puntx=",str(Punt[Punt_tel].x,3,3),"punty=",str(Punt[Punt_tel].y,3,3),"puntz=",str(Punt[Punt_tel].z,3,3),"\n")
#declare Punt_tel=Punt_tel+1;
#declare G2=<a,a>; #declare G3=<j2,j1>; #declare rot4dres=rotate4d(G2,G3,rot4dangles);#declare G2=rot4dres[0] ;#declare G3=rot4dres[1]; 
#declare Punt[Punt_tel]=<G3.x*2/(1+G2.x), G3.y*2/(1+G2.x),-G2.y*2/(1+G2.x)>; 
#debug concat ("#=",str(Punt_tel.x,3,0),"puntx=",str(Punt[Punt_tel].x,3,3),"punty=",str(Punt[Punt_tel].y,3,3),"puntz=",str(Punt[Punt_tel].z,3,3),"\n")
#declare Punt_tel=Punt_tel+1;
#declare G2=<a,-a>; #declare G3=<j2,j1>; #declare rot4dres=rotate4d(G2,G3,rot4dangles);#declare G2=rot4dres[0] ;#declare G3=rot4dres[1]; 
#declare Punt[Punt_tel]=<G3.x*2/(1+G2.x), G3.y*2/(1+G2.x),-G2.y*2/(1+G2.x)>; 
#debug concat ("#=",str(Punt_tel.x,3,0),"puntx=",str(Punt[Punt_tel].x,3,3),"punty=",str(Punt[Punt_tel].y,3,3),"puntz=",str(Punt[Punt_tel].z,3,3),"\n")
#declare j2=j2+2*a;
#end
#declare j1=j1+2*a;
#end


//texture for cylinders
#declare tex_cyl= texture { pigment{Orange} 
              finish {
                                ambient 0.6
                                diffuse 0.6
                                reflection {0}
                                specular 5
                                roughness .001          
                                 }  }
//texture for spheres
#declare tex_bol= texture { pigment{ Yellow} 
              finish {
                                ambient 0.6
                                diffuse 0.7
                                reflection {0}
                                specular 5
                                roughness .001          
                                 } }                                  
//small sphere for end of cylinders
#declare bol=object{sphere{<0,0,0>,thick*1.0} texture{tex_bol}} 

//draw projected cube       
#declare hypercube=union{ 

#declare j1=0;
#while (j1<13)
#declare j2=1;
#while (j2<5)
#declare b=j2+1;#if (b=5) #declare b=1; #end
cylinder{Punt[j1+j2],Punt[j1+b],thick texture{tex_cyl}}
object {bol texture{tex_bol} translate Punt[j1+j2]}
#declare j2=j2+1;
#end
#declare j1=j1+4;
#end 

#declare j1=1;
#while (j1<9) 
cylinder{Punt[j1],Punt[j1+8],thick texture{tex_cyl}}
#declare j1=j1+1;
#end 

#declare j1=0;
#while (j1<9)
#declare j2=1;
#while (j2<5)
cylinder{Punt[j1+j2],Punt[j1+j2+4],thick texture{tex_cyl}}
#declare j2=j2+1;
#end
#declare j1=j1+8;
#end 
}//voor union

object{hypercube  rotate y*roty  rotate x*rotx rotate z*rotz}
/*
//colored sides
 
object{ polygon {    4,
    Punt[2], Punt[6], Punt[14], Punt[10]
     texture { pigment{ HuntersGreen transmit 0.25} 
              finish {
                                ambient 0.8
                                diffuse 0.7
                                reflection {0.}
                                         
                                 } }   }
    rotate y*roty  rotate x*rotx rotate z*rotz }
object{ polygon {    4,
    Punt[5], Punt[6], Punt[14], Punt[13]
     texture { pigment{ Yellow} 
              finish {
                                ambient 0.8
                                diffuse 0.7
                                reflection {0.}
                                         
                                 } }   }
    rotate y*roty  rotate x*rotx rotate z*rotz }

object{ polygon {    4,
    Punt[1], Punt[2], Punt[10], Punt[9]
     texture { pigment{ Pink} 
              finish {
                                ambient 0.8
                                diffuse 0.7
                                reflection {0.}
                                         
                                 } }   }
    rotate y*roty  rotate x*rotx rotate z*rotz }
object{ polygon {    4,
    Punt[1], Punt[5], Punt[13], Punt[9]
     texture { pigment{ SpicyPink} 
              finish {
                                ambient 0.8
                                diffuse 0.7
                                reflection {0.}
                                         
                                 } }   }
    rotate y*roty  rotate x*rotx rotate z*rotz }
*/

//plane
/*object{plane{<0,-1,0>,2+thick} texture { pigment{ Scarlet} 
              finish {
                                ambient 0.6
                                diffuse 0.7
                                reflection {0.3}
                                specular 5
                                roughness .001          
                                 } } }  */

