#!/usr/bin/env python

__author__      = "Mathifold"
__license__ = "Creative Commons Attribution 4.0"
__email__   = "mathifold@gmail.com"

var('R r a b t x y theta')

# (a,b) |-> f(a,b) es la aplicacion afin que manda el centro del plano
# al centro inicial de la circunferencia pequenna y gira pi/2.
#       (0,0)  |-> (r-R, 0)
#       (R,0)  |-> (r-R, R)
#       (0,-R) |-> (r,0)
f = vector((-b+(r-R), a))

# Giro de angulo theta alrededor de 0
g = matrix([[cos(theta), sin(theta)],[-sin(theta), cos(theta)]])

# Composicion de la traslacion con el giro. Esta aplicacion coloca el circulo
# de radio R centrado en 0 en la posicion deseada en el circulo grande
# y, posteriormente, lo rota theta radianes alrededor de la circunferencia grande.
f_theta = g*f.transpose()

# Parametrizacion de la circunferencia pequenna centrada en (0,0)
gamma = vector((R*cos(t-pi/2), R*sin(t-pi/2)))

# Imagen de la circunferencia pequenna por f_theta.
# La funcion gamma_trans(t, theta) devuelve la imagen del punto
# gamma(t) (perteneciente a la circunferencia pequenna) tras
# ser colocado junto a la circunferencia grande y, posteriormente,
# trasladado theta radianes en la circunferencia grande.
gamma_trans = vector(f_theta.subs(a==gamma[0]).subs(b==gamma[1]).transpose().list())

gamma_hipocicloide = gamma_trans.subs(theta == theta == R/r*t)

# Animacion de la hipocicloide irracional

r0 = 2*pi
R0 = 1

dibujo = [implicit_plot(x^2+y^2==r0^2, (x, -r0, r0), (y, -r0, r0), aspect_ratio=1)\
    + parametric_plot(gamma_trans.subs(theta == R/r*s).subs(R==R0).subs(r==r0), (t, 0, 2*pi), aspect_ratio=1)\
    + point(gamma_hipocicloide.subs(t == s).subs(R==R0).subs(r==r0), pointsize=30, color='green', aspect_ratio=1)\
    + parametric_plot(gamma_hipocicloide.subs(R==R0).subs(r==r0), (t, 0, s), color='red', aspect_ratio=1)\
            for s in srange(0.1, 32*pi, 0.5)]

show(animate(dibujo, aspect_ratio=1))
