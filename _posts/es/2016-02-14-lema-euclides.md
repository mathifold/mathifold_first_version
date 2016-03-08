---
title:  "Lema de Euclides"
categories: prime_factorisation
langid: euclids_lemma
mathjax: true
---

<b>TEOREMA:</b> Dados $$a$$, $$b$$, $$c\in\mathbb{Z}$$ tales que $$a\vert bc$$ y $$\text{mcd}(a,b)=1$$, se tiene que entonces $$a\vert c$$.

<b>DEMOSTRACIÓN:</b> Como $$\text{mcd}(a,b)=1$$, por el Teorema de Bézout existen $$x$$, $$y\in\mathbb{Z}$$ tales que $$ax+by=1$$. Por tanto

$$c=c\cdot1=c(ax+by)=a(cx)+(bc)y$$

Como $$a\vert bc$$, se sigue que $$a$$ divide a los dos sumandos de
la derecha, luego $$a\vert c$$.