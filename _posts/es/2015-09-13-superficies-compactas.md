---
title:  "Superficies compactas"
categories: compact_surfaces
langid: compactsurfaces
mathjax: true
---
Una superficie es una variedad de dimensión 2. Como ejemplos tenemos:

* La esfera <span>$$S^2=\{(x,y,z)\in \mathbb{R}^3 \, | \,x^2+y^2+z^2=1\}$$</span>
* El toro <span>$$T^2=\{(x,y,z)\in \mathbb{R}^3 \, | \, (\sqrt{x^2+y^2}-2)^2+z^2=1\}$$</span>

{% resource 01.png %}

De hecho, siempre que tenemos una ecuación regular $$S=\{(x,y,z) \, | \, F(x,y,z)=0\}$$ en $$\mathbb{R}^3$$
obtenemos una superficie.
La condición de ser regular es que $$\nabla F(x,y,z) \neq 0$$, $$\forall (x,y,z)\in S$$.

Dadas dos superficies $$M_1$$ y $$M_2$$, podemos hacer su suma conexa: hacemos dos pequeños agujeros
y unimos por los bordes. La denotaremos por $$M_1 \# M_2$$

{% resource 02.png %}

Por supuesto, ¡la suma conexa de dos superficies vuelve a ser una superficie!

{% resource 03.png %}

Así podemos construir toros dobles, triples... en general hablamos de toros de género $$g$$ (y los denotaremos
por $$\Sigma_g$$)


{% resource 04.png %}

¿Son estos todos los tipos de superficie que podemos tener? Lo vamos a analizar

Para ir entrenando, vamos a conocer algunas otras superficies, algunas de ellas con borde.
Esto se puede conseguir, muchas veces, pegando los lados de diversos polígonos.

Al pegar dos lados de un cuadrado con la misma orientación, obtenemos un cilindro

{% resource 05.png %}

Pero si cambiamos la orientación de uno de los lados, obtenemos una cinta de Möbius

{% resource 06.png %}

El cilindro y la cinta de Möbius no pueden ser la misma superficie, porque el cilindro tiene como
borde dos círculos, mientras que la cinta de Möbius sólo tiene uno.

Mediante el pegado de polígonos también se pueden crear superficies cerradas. Un ejemplo es el toro

{% resource 07.png %}

Y pronto encontramos una superficie más compleja: la botella de Klein

{% resource 08.png %}

¡No se puede meter en el espacio sin que haya cruces! Pero no tiene bordes ni roturas,
así que es una superficie cerrada en toda regla.

Una superficie todavía más rara: el plano proyectivo

{% resource nb1.mp4 %}

Ésta se consigue al identificar los puntos opuestos de una esfera, o al identificar el borde de un disco
como en la figura


{% resource 10.png %}

De hecho, todas las superficies que queramos se pueden obtener mediante el pegado de las aristas de un polígono.
Por ejemplo, si tenemos dos superficies construidas a partir de polígonos, su suma conexa también se construye
pegando un polígono


{% resource 20.png %}


Esto es lo que ocurre para el doble toro


{% resource 21.png %}


Cuando queramos referirnos a un pegado que se hace en las aristas de un polígono, utilizaremos "palabras"


{% resource 13.png %}


Sólo hay que recorrer todo el polígono y escribir las letras, que estarán "elevadas a $$-1$$" si nos encontramos
la flecha en dirección contraria

Ahora conocemos muchas superficies que se consiguen mediante el pegado de un polígono

* El toro $$T^2$$: $$aba^{-1}b^{-1}$$
* El doble toro $$T^2 \# T^2$$: $$aba^{-1}b^{-1}cdc^{-1}d^{-1}$$
* El toro de género $$g$$ $$\Sigma_g$$: $$a_1 b_1 a_1^ {-1}b_1^{-1}\cdots a_gb_ga_g^{-1}b_g^{-1}$$
* La botella de Klein $$Kl$$: $$abab^{-1}$$
* El plano proyectivo $$\mathbb{R}P^2$$: $$aa$$

Y simbólicamente podemos añadir la esfera $$S^2$$: $$aa^{-1}$$

{% resource 22.png %}

Antes de comenzar a hacer cálculos y comprobar que el método de las palabras realmente nos va a ayudar a
clasificar las superficies compactas, debemos hacer algunas observaciones.

1- El plano proyectivo surge al pegar una banda de Möbius y un disco por el borde

{% resource 12.png %}

En efecto, si quitamos un disco y pegamos...

{% resource 11.png %}


2- La botella de Klein se construye al unir dos bandas de Möbius por el borde, y por eso es igual
a la suma conexa de dos planos proyectivos

{% resource 26.png %}

Aunque si lo queremos ver con diagramas de corte y pegado, lo podemos hacer así


{% resource 16.png %}

3- La suma conexa de un toro y un plano proyectivo es igual a la suma conexa de una botella de Klein
y un plano proyectivo. Así, como la botella de Klein es la suma conexa de dos planos proyectivos,
las dos superficies anteriores son la suma conexa de tres planos proyectivos

¿Y esto de dónde viene? En primer lugar, hacer suma conexa con un toro es añadir un "asa"

{% resource 17.png %}

Y para hacer una suma conexa con una botella de Klein, pues también hay que pegar un asa,
¡pero hay que pegarla con las direcciones cambiadas!

{% resource 18.png %}

Y si a un plano proyectivo le hacemos la suma conexa con un toro o con una botella de Klein...
pues lo que queda es lo mismo, porque dentro del plano proyectivo hay una banda de Möbius

{% resource 19.png %}

Al final todo esto nos hace pensar lo siguiente: podemos hacer sumas conexas de toros, sumas conexas
de planos proyectivos... ¡pero al hacer sumas conexas de toros y planos proyectivos no conseguimos
nada nuevo, porque todo vuelve a ser una suma conexa de planos proyectivos! Esto nos anima a conjeturar el

**Teorema de Clasificación de Superficies Compactas**

Toda superficie compacta y conexa pertenece a uno de los siguientes tres grupos:

* La esfera $$S^2$$
* La suma conexa de $$g$$ toros (o toro de género $$g$$) $$\Sigma_g$$
* La suma conexa de $$k$$ planos proyectivos (que llamaremos $$X_k$$)

y todas estas superficies son distintas entre sí, dando lugar a una clasificación completa

**Demostración**

No vamos a ver por ahora que todas estas superficies son distintas; esto requiere herramientas más potentes
y lo veremos cuando estudiemos el grupo fundamental (no basta con ver que estas superficies "parecen" distintas:
¡la suma conexa entre un plano proyectivo y un toro y entre un plano proyectivo y una botella de Klein son iguales!)

El primer paso: cuando tengamos una superficie siempre la vamos a poder dividir en polígonos pequeñitos que luego
podremos volver a unir para reconstruir la superficie, como en el siguiente toro

{% resource 27.png %}

(¡Cuidado! Puede parecer sencillo de hacer, y en superficies lo es, pero hacer algo parecido en dimensiones
superiores es más difícil... ¡y de hecho a veces no se puede!) Tendríamos algo así, por ejemplo

{% resource 28.png %}

Una vez que se tienen estos trocitos, es posible que nos hayan quedado demasiados... si hay polígonos distintos
en los que hay que pegar una arista, la pegamos y reducimos el número de polígonos utilizados

Al final, si lo hemos hecho bien... debemos quedarnos con un solo polígono. Si nos quedasen varios en los
que no hay ninguna arista común, al pegar todo cada polígono nos daría su propia superficie... ¡y nuestra
superficie es conexa!

Y cuando tenemos un polígono, ¿cómo es el pegado? Bueno, pues los lados se deben pegar por parejas. Si hubiese
algún lado sin pareja, esto nos daría un borde en la superficie, y si quisiéramos pegar más de dos lados a la
vez, pues nos quedaría algo como

{% resource 09.png %}

¡Esto no es una superficie!

Sabiendo todas estas cosas, ahora procedemos por pasos

<b>PASO 1:</b> Debemos mirar si en la palabra de nuestro polígono hay alguna letra que aparece las dos veces en el
mismo sentido, es decir, algo del tipo $$ap_1ap_2$$. Entonces hay alguna banda de Möbius...

{% resource 15.png %}

...y parece que vamos a sacar un plano proyectivo en suma conexa... ¡exacto! Sólo hay que hacer una pequeña
manipulación de corte y pegado


{% resource 24.png %}

Repitiendo este proceso cuantas veces haga falta, "aislamos" los planos proyectivos y obtenemos una palabra
del tipo $$a_1a_1\cdots a_ka_kp$$, donde en $$p$$ cada pareja de lados está en sentido opuesto.

<b>PASO 2:</b> Ahora elegimos (si es que no hemos acabado) una pareja de lados que está en sentido opuesto,
$$ap_1a^{-1}p_2$$. Lo vamos a elegir de tal modo que los lados estén lo más cerca posible. ¡Puede incluso ocurrir
que sean adyacentes! Pero entonces mejor para nosotros, porque podemos simplificar el pegado y ahorrarnos
una letra

{% resource 23.png %}

Y en el caso extremo, podemos tener que nuestra superficie es $$aa^{-1}$$. ¡Entonces es una esfera! Pero
suponiendo el caso general en que los lados $$a$$ no son adyacentes, podemos encontrar algún otro lado $$b$$
por medio. Su pareja $$b^{-1}$$ debe estar al otro lado de $$a$$ y $$a^{-1}$$, pues los habíamos elegido lo más
cerca posible. En consecuencia tenemos cuatro lados que parecen de un toro... y en efecto podemos volver a
"aislarlo"

{% resource 25.png %}

De nuevo repitiendo el proceso, separamos los toros hasta que no quede nada. por tanto hemos obtenido:
nuestra superficie es una esfera, o una suma conexa de planos proyectivos, o una suma conexa de toros,
o una suma conexa de planos proyectivos y toros que, como sabemos, vuelve a ser una suma conexa de planos
proyectivos. Así que por fin, podemos concluir que nuestra clasificación es cierta.
