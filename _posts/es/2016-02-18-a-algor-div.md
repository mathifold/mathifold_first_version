---
title:  "Algoritmo de división"
categories: prime_factorisation
langid: division_algorith
mathjax: true
---

<b>TEOREMA:</b> (Algoritmo de división) Dados $$a$$, $$b\in\mathbb{Z}$$ con $$b>0$$, existen $$q$$, $$r\in\mathbb{Z}$$ únicos tales que $$a=qb+r$$ y $$0\le r\lt b$$.

<b>DEMOSTRACIÓN:</b>  Consideremos el conjunto $$S=\{a-xb: x\in\mathbb{Z},\ a-xb\ge0\}$$. Como para $$x=-\vert a\vert $$ se tiene $$a-xb=a+\vert a\vert b\ge a+\vert a\vert \ge0$$, el conjunto $$S$$ es no vacío. Así, $$S$$ tiene un elemento mínimo $$r=a-qb$$. Por definición, $$r\ge0$$. Veamos que también $$r\lt b$$. En efecto, si fuera $$r\ge b$$, entonces tendríamos $$0\le r-b=a-(q+1)b$$, luego $$r-b$$ sería un elemento de $$S$$ menor que $$r$$, lo que es absurdo. Esto demuestra la existencia de la división.

Para ver la unicidad, supongamos que tenemos dos divisiones distintas $$qb+r=a=q'b+r'$$ con $$0\le r,r'\lt b$$. Entonces se tendría $$(q-q')b=r'-r$$, es decir, $$b\vert r'-r$$. Ahora bien, $$r'-r\lt b-0=b$$ y $$r-r'\lt b-0=b$$, por lo que $$\vert r'-r\vert \lt b=\vert b\vert $$. Por las propiedades de la divisibilidad, $$r'-r=0$$, de donde se deduce $$r=r'$$ y $$q=q'$$.