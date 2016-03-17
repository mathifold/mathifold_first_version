---
title:  "Ejemplo: Algoritmo de Euclides para la Ecuación Diofántica Lineal"
categories: prime_factorisation
langid: euclid_diophantine_example
mathjax: true
---

<b>EJEMPLO:</b> Retomemos el ejemplo anterior para ver cómo resolver de forma práctica una ecuación como la del teorema anterior. Nos planteamos resolver la ecuación $$72x+28y=8$$. Como $$\text{mcd}(72,28)=4$$ y $$4\vert 8$$, la ecuación tiene solución. Además, vimos que podemos escribir $$4=2\cdot72-5\cdot28$$, por lo que multiplicando por $$2$$ obtenemos que $$x_0=4,\ y_0=-10$$ es una solución. Las soluciones de la ecuación serán, por tanto, de la forma

$$\eqalign{
x=4+7t\cr
y=-10-18t}$$

con $$t\in\mathbb{Z}$$. Obsérvese que este proceso puede interpretarse como encontrar todos los puntos de la recta $$72x+28y=8$$ del plano afín que tienen sus dos coordenadas enteras. El de la ecuación diofántica lineal nos da una caracterización de cuándo una recta afín dada por una ecuación implícita con coeficientes enteros tiene puntos con coordenadas enteras. Además, en caso afirmativo, los puntos de coordenadas enteras se pueden obtener dando valores enteros a una ecuación paramétrica (con coeficientes enteros) de la recta.