---
title: "Introducción a los espacios topológicos"
categories: topological_spaces
langid: top_spaces_intro
mathjax: true
---

Las matemáticas son un proceso de abstracción de ideas. En el caso de la topología, la idea principal es la de <i>proximidad</i>; y el proceso de abstracción es claro. Veamos cómo es este proceso de abstracción.

<b><u>La distancia euclidiana</u></b> (la de toda la vida)

En la vida real, para hablar de <i>proximidad</i>, hablamos de distancia. En concreto, hablamos de distancia euclideana. Esta es la distancia a la que estamos acostumbrados desde pequeños. Si la pensamos en el plano, con sus ejes coordenados, es la distancia que nos da el teorema de Pitágoras (la distancia entre dos puntos del plano al cuadrado es la suma de los cuadrados de las distancias entre sus respectivas coordenadas).

Una frase que seguro nos resulta familiar a todos. ¿Qué es una circunferencia? Una circunferencia es <i>el conjunto de puntos del plano que equidistan de cierto punto</i>, al que llamamos centro de la circunferencia. Y a la distancia del centro a cualquiera de estos puntos la llamamos radio.

Supongamos que estamos hablando sobre los puntos cercanos a cierto punto $$P$$. Cuando hablamos de puntos cercanos a $$P$$ nos referimos a puntos que estan a distancia menor de una que consideramos razonable, ¿verdad? Es decir, por puntos cercanos a $$P$$ entendemos los puntos que distan de $$P$$ menos de esta distancia razonable. Esto es, los puntos que están <i>dentro</i> de la circunferencia de centro $$P$$ y radio dicha distancia razonable. Un ejemplo concreto: estamos andando por la Puerta del Sol en Madrid y queremos saber qué hoteles están cerca de nosotros. Por cerca, en este caso, consideramos unos 150 metros. Entonces, los hoteles cercanos a nuestra posición serían los que caen dentro del círculo azul.

{% resource top_spaces-3.png %}

Esta región azul es lo que entendemos por <i>proximidad</i> del lugar en el que estamos. Y esta es la idea que nos interesa. A esta región de puntos próximos a Sol la llamaremos <i>bola de centro Sol y radio 150 metros</i>. Así, tenemos una forma de hablar en el plano de puntos cercanos a cierto punto.

<b><u>Otras distancias</u></b>

Recordemos nuestro objetivo: <i>proximidad</i>. ¿Es necesario hablar de la distancia en el sentido anterior para hablar de proximidad? ¿O es posible que haya más distancias con las que definir las proximidades de un punto?

Supongamos que somos un taxista o una taxista en la ciudad de New York. Un cliente se sube y nos pide que le llevemos a la boca de metro más cercana desde el punto rojo. Si consideramos la misma distancia que antes, tendríamos que llevar al cliente a la boca de metro situada en la parte inferior de la imagen. Pero la que está realmente más cerca desde el punto de vista del taxi es la de la izquierda.

{% resource top_spaces-4.png %}

Por tanto, para hablar de <i>proximidad</i> en este caso, hablamos de la distancia que hay que recorrer por las calles para llegar al punto. Esta distancia se llama de hecho distancia taxi o distancia Manhattan.

Hemos encontrado una nueva forma de hablar de puntos cercanos a cierto punto en el plano. Esto nos hace reflexionar. ¿Hasta qué punto es necesario hablar de <i>una</i> distancia concreta para hablar de <i>proximidad</i>? La respuesta es que se puede hablar de proximidad sea cual sea la distancia que vayamos a considerar. Es decir, no necesitamos hablar de una distancia particular para poder hablar de proximidad.

Así, tenemos una forma de hablar de puntos cercanos a cierto punto en cualquier conjunto de puntos en el que hayamos definido una distancia entre puntos. La distancia es arbitraria, pero tiene que ser una distancia, claro. Esto quiere decir que si $$a$$ y $$b$$ son dos puntos, la distancia entre ellos es siempre positiva; es cero si y sólo si los puntos son iguales (la distancia de mi posición a mi posición es cero); es la misma si vamos de $$a$$ a $$b$$ que si vamos de $$b$$ a $$a$$; y se cumple que si vamos de $$a$$ a $$b$$ pasando por $$c$$, entonces recorremos más distancia que si vamos directamente de $$a$$ a $$b$$. ¿Tiene sentido, verdad?

A un conjunto en el que hemos definido una distancia lo llamamos <i>espacio métrico</i>. A la región de puntos próximos (a distancia menor de r, por ejemplo) a un punto $$P$$ dado la llamaremos como antes <i>bola de centro $$P$$ y radio r</i>. Además podemos hablar de los alrededores del punto $$P$$, refiriéndonos a cualquier conjunto de puntos que contenga alguna bola centrada en $$P$$. A este tipo de conjunto lo llamaremos <i>entorno</i> de $$P$$. Los entornos de $$P$$ verifican una serie de propiedades que podéis comprobar echando mando de un papel y un lápiz:

1. $$1.$$ $$P$$ está en cualquier entorno de $$P$$
2. $$2.$$ Si dos personas distintas hablan de los alrededores de $$P$$, igual no se refieren al mismo conjunto de puntos. Pero desde luego los puntos comunes a ambos conjuntos se pueden considerar también los alrededores de $$P$$. Es decir, la intersección de entornos de $$P$$ es un entorno de $$P$$.
3. $$3.$$ Si un conjunto de puntos contiene algún entorno de $$P$$, entonces es un entorno de $$P$$.
4. $$4.$$  En los alrededores de $$P$$ siempre hay algún conjunto de puntos suficientemente cercanos a $$P$$ tales que los alrededores de $$P$$ de los que hablabamos son también alrededores de cada uno de esos puntos. Es decir, dado cualquier entorno de $$P$$ existe otro entorno de $$P$$ tal que el primer entorno es entorno de todos los puntos del segundo entorno.

Estas propiedades, que parecen un poco un trabalenguas, son las que nos van a servir para dar el último paso hacia la idea más pura de <i>proximidad</i>.

<b><u>¿Quién necesita distancias?</u></b>

De nuevo, con la mirada puesta en nuestro objetivo (la idea de <i>proximidad</i>), vamos a dar un útlimo paso de abstracción. Ya hemos visto que podemos hablar de <i>proximidad</i> sin tener que hablar de una distancia en concreto. ¿Pero realmente necesitamos hablar de alguna distancia en absoluto para hablar de proximidad? Veamos como podemos prescindir de cualquier tipo de distancia y seguir hablando de los puntos cercanos a un punto sin problemas.

Consideramos un punto cualquiera $$P$$ de nuestro conjunto de puntos. Definimos (porque queremos y podemos) una colección de conjuntos que contengan a $$P$$ de tal manera que se verifiquen las propiedades de antes, y los llamamos entornos de $$P$$.

Diremos que un punto está cerca de $$P$$ si hay un entorno de $$P$$ (alguno de estos conjuntos que hemos definido como nos ha dado la gana) que contenga a dicho punto. Puede parecer una chorrada de definición de <i>proximidad</i>, que nada que ver tiene con la idea de proximidad que usamos a diario. Pero veamos con un ejemplo como sí que funciona perfectamente.

Supongamos que queremos decir que nos estamos acercando a cierto sitio $$P$$. Tenemos que usar el concepto de proximidad para expresar esto, claro está. Es evidente que hablando de la proximidad definida con distancias lo podemos expresar sin problemas. La distancia de nuestra posición al punto es cada vez menor, luego cada vez estamos más próximos al punto y efectivamente nos estamos acercando al punto. Pero nos olvidamos de la distancia e intentamos expresar esto mismo con la idea de entorno que acabamos de desarrollar.

Dado cualquier entorno del punto $$P$$, llegará un momento a partir del cual nos encontraremos dentro de dicho entorno.

{% resource top_spaces-5.png %}

¡Nos estamos acercando a $$P$$! Y hemos conseguido expresarlo sin hablar para nada de distancias.

Hemos conseguido así una idea abstracta que surge a partir de lo que entendemos por proximidad. A un conjunto en el que para cada punto hemos definido una colección de entornos con las propiedades de antes lo llamamos <i>espacio topológico</i>.
