---
title:  "Algoritmo de Euclides"
categories: prime_factorisation
langid: euclids_algorithm
mathjax: true
---

Para el cálculo del máximo común divisor no siempre es práctico usar la descomposición en números primos (que requiere, por ejemplo, saber factorizar los números en cuestión). Usaremos en cambio muchas veces el método más clásico:

<b>TEOREMA:</b> Sean $$a$$, $$b$$ números enteros con $$b>0$$. Definimos por recurrencia $$r_{-1}=a$$, $$r_0=b$$ y, supuestos definidos $$r_{k-1},r_k$$ con $$r_k\ne0$$, definimos  $$r_{k+1}$$ como el resto de la división euclídea de de $$r_{k-1}$$ entre $$r_k$$. Entonces, existe algún $$n$$ tal que $$r_n=0$$, y se verifica además que $$r_{n-1}=\text{mcd}(a,b)$$.

<b>DEMOSTRACIÓN:</b>  De la definición por recurrencia se sigue que $$0\le r_{k+1}\lt r_k$$ para todo $$k\ge0$$. Por tanto $$r_0,r_1,\dots$$ forma una sucesión estrictamente decreciente de enteros no negativos, por lo que tiene que ocurrir $$r_n=0$$ para algún miembro de la sucesión. Por otra parte, si para cada $$k=0$$, $$\dots$$, $$n$$ escribimos la división $$r_{k-1}=q_kr_k+r_{k+1}$$, por las propiedades del máximo común divisor se tendrá $$\text{mcd}(r_{k-1},r_k)=\text{mcd}(q_kr_k+r_{k+1},r_k)=\text{mcd}(r_{k+1},r_k)$$. Por tanto:

$$\text{mcd}(a,b)=\text{mcd}(r_{-1},r_0)=\text{mcd}(r_0,r_1)=
\dots=\text{mcd}(r_{n-1},r_n)=\text{mcd}(r_{n-1},0)=r_{n-1}$$