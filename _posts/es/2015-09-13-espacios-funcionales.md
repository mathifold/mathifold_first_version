---
title:  "Espacios funcionales usuales"
categories: c4
langid: usualfunction
mathjax: true
---
a) Para toda función $$u\in C^\infty_0(\mathbb{R} ^n)$$, se cumple la desigualdad

$$\biggl(\int_{\mathbb{R} ^n}|u|^{\frac{n}{n-1}}\mathrm{d} x\biggr)^{\frac{n-1}{n}}\leqslant\frac{1}{2}\prod_{i=1}^n\biggl(\int_{\mathbb{R} ^n}|\partial_i u|\mathrm{d} x\biggr)^{\frac{1}{n}}$$

Se tiene por tanto que $$W^{1,1}(\mathbb{R} ^n)\subset L^{\frac{n}{n-1}}(\mathbb{R} ^n)$$ con inclusión continua

b) Sean $$q\in[1,n)$$ y $$p$$ tales que $$\frac{1}{p}=\frac{1}{q}-\frac{1}{n}$$. Para toda función $$u\in W^{1,q}(\mathbb{R} ^n)$$,

$$\displaystyle \biggl(\int_{\mathbb{R} ^n}|u|^p\mathrm{d} x\biggr)^{\frac{1}{p}}\leqslant\frac{p(n-1)}{2n}\biggl[\biggl(\int_{\mathbb{R} ^n}|\nabla u|^q\mathrm{d} x\biggr)^{\frac{1}{q}}+\biggl(\int_{\mathbb{R} ^n}|u|^{q}\mathrm{d} x\biggr)^{\frac{1}{q}}\biggr]$$

de modo que $$W^{1,q}(\mathbb{R} ^n)\subset L^p(\mathbb{R} ^n)$$ con inclusión continua

c) Para cualesquiera números reales $$1\leqslant q \lt p$$ y enteros $$0\leqslant m \lt k$$ tales que $$\frac{1}{p}=\frac{1}{q}-\frac{k-m}{n}$$, $$W^{k,q}(\mathbb{R} ^n)\subset W^{m,p}(\mathbb{R} ^n)$$ con inclusión continua

DEMOSTRACIÓN

a) Presentamos la demostración para $$n=3$$, siendo similar la de $$n\neq 3$$. Sea $$P=(x_0,y_0,z_0)\in\mathbb{R} ^3$$, y $$l_x$$, $$l_y$$ y $$l_z$$, $$\pi_{xy}$$, $$\pi_{yz}$$ y $$\pi_{zx}$$ las rectas y planos que pasan por $$P$$ y que son paralelos a los ejes $$x$$, $$y$$, $$z$$ y a los planos $$xy$$, $$yz$$, $$zx$$. 
Por ser $$u$$ de soporte compacto,

$$u(P)=\int_{-\infty}^{x_0}\partial_{x}u(x,y_0,z_0)\mathrm{d} x=-\int_{x_0}^{\infty}\partial_{x}u(x,y_0,z_0)\mathrm{d} x$$

y por tanto, $$\displaystyle |u(P)|\leqslant\frac{1}{2}\int_{l_x}|\partial_{x}u(x,y_0,z_0)|\mathrm{d} x$$. Argumentando de modo similar para $$\partial_{y}u$$ and $$\partial_{z}u$$, obtenemos

$$|u(P)|^{\frac{3}{2}}\leqslant\Bigl(\frac{1}{2}\Bigr)^{\frac{3}{2}}\biggl(\int_{l_x}|\partial_{x}u(x,y_0,z_0)|\mathrm{d} x\biggr)^{\frac{1}{2}}\biggl(\int_{l_y}|\partial_{y}u(x_0,y,z_0)|\mathrm{d} y\biggr)^{\frac{1}{2}}\biggl(\int_{l_z}|\partial_{z}u(x_0,y_0,z)|\mathrm{d} z\biggr)^{\frac{1}{2}}$$

Integramos ahora $$x_{0}$$ sobre $$\mathbb{R} $$. Utilizamos la desigualdad de Hölder:

$$\int_{l_x}|u(x,y_0,z_0)|^{\frac{3}{2}}\mathrm{d} x\leqslant\Bigl(\frac{1}{2}\Bigr)^{\frac{3}{2}}\biggl(\int_{l_x}|\partial_{x}u(x,y_0,z_0)|\mathrm{d} x\biggr)^{\frac{1}{2}}\int_{l_x}\biggl[\biggl(\int_{l_y}|\partial_{y}u(x_0,y,z_0)|\mathrm{d} y\biggr)^{\frac{1}{2}}\biggl(\int_{l_z}|\partial_{z}u(x_0,y_0,z)|\mathrm{d} z\biggr)^{\frac{1}{2}}\biggr]\mathrm{d} x\leqslant\Bigl(\frac{1}{2}\Bigr)^{\frac{3}{2}}\biggl(\int_{l_x}|\partial_{x}u(x,y_0,z_0)|\mathrm{d} x\biggr)^{\frac{1}{2}}\biggl(\int_{\pi_{xy}}|\partial_{y}u(x,y,z_0)|\mathrm{d} x\mathrm{d} y\biggr)^{\frac{1}{2}}\biggl(\int_{\pi_{xz}}|\partial_{z}u(x,y_0,z)|\mathrm{d} x\mathrm{d} z\biggr)^{\frac{1}{2}}$$

Pasamos a integrar $$y_0$$ sobre $$\mathbb{R} $$, aplicando de nuevo la desigualdad de Hölder:

$$\displaystyle \int_{\pi_{xy}}|u(x,y,z_0)|^{\frac{3}{2}}\mathrm{d} x\mathrm{d} y\leqslant\Bigl(\frac{1}{2}\Bigr)^{\frac{3}{2}}\biggl(\int_{\pi_{xy}}|\partial_{y}u(x,y,z_0)|\mathrm{d} x\mathrm{d} y\biggr)^{\frac{1}{2}}\int_{l_y}\biggl[\biggl(\int_{l_x}|\partial_{x}u(x,y_0,z_0)|\mathrm{d} x\biggr)^{\frac{1}{2}}\biggl(\int_{\pi_{xz}}|\partial_{z}u(x,y_0,z)|\mathrm{d} x\mathrm{d} z\biggr)^{\frac{1}{2}}\biggr]\mathrm{d}\leqslant\Bigl(\frac{1}{2}\Bigr)^{\frac{3}{2}}\biggl(\int_{\pi_{xy}}|\partial_{y}u(x,y,z_0)|\mathrm{d} x\mathrm{d} y\biggr)^{\frac{1}{2}}\biggl(\int_{\pi_{xy}}|\partial_{y}u(x,y,z_0)|\mathrm{d} x\mathrm{d} y\biggr)^{\frac{1}{2}}\biggl(\int_{\mathbb{R} ^3}|\partial_{z}u|\mathrm{d} x\mathrm{d} y\mathrm{d} z\biggr)^{\frac{1}{2}}$$

Integrando por tercera vez $$z_0$$ sobre $$\mathbb{R} $$, obtenemos

$$\displaystyle \int_{\mathbb{R} ^3}|u|^{\frac{3}{2}}\mathrm{d} x\mathrm{d} y\mathrm{d} z\leqslant\Bigl(\frac{1}{2}\Bigr)^{\frac{3}{2}}\biggl(\int_{\mathbb{R} ^3}|\partial_{z}u|\mathrm{d} x\mathrm{d} y\mathrm{d} z\biggr)^{\frac{1}{2}}\int_{l_z}\biggl[\biggl(\int_{\pi_{xy}}|\partial_{x}u(x,y,z_0)|\mathrm{d} x\mathrm{d} y\biggr)^{\frac{1}{2}}\biggl(\int_{\pi_{xy}}|\partial_{y}u(x,y,z_0)|\mathrm{d} x\mathrm{d} y\biggr)^{\frac{1}{2}}\biggl]\mathrm{d} z\leqslant\Bigl(\frac{1}{2}\Bigr)^{\frac{3}{2}}\biggl(\int_{\mathbb{R} ^3}|\partial_{x}u|\mathrm{d} x\mathrm{d} y\mathrm{d} z\biggr)^{\frac{1}{2}}\biggl(\int_{\mathbb{R} ^3}|\partial_{y}u|\mathrm{d} x\mathrm{d} y\mathrm{d} z\biggr)^{\frac{1}{2}}\biggl(\int_{\mathbb{R} ^3}|\partial_{z}u|\mathrm{d} x\mathrm{d} y\mathrm{d} z\biggr)^{\frac{1}{2}}$$

y sólo queda elevar ambos miembros a $$\dfrac{2}{3}$$.

Así, por propiedades de densidad, $$W^{1,1}(\mathbb{R} ^n)\subset L^{\frac{n}{n-1}}(\mathbb{R} ^n)$$, con

$$\|u\|_{L^{\frac{n}{n-1}}}=\biggl(\int_{\mathbb{R} ^n}|u|^{\frac{n}{n-1}}\mathrm{d} x\biggr)^{\frac{n-1}{n}}\leqslant\frac{1}{2}\int_{\mathbb{R} ^n}|\nabla u|\mathrm{d} x=\frac{1}{2}(\|u\|_{W^{1,1}}-\|u\|_{C^0})\leqslant\frac{1}{2}\|u\|_{W^{1,1}}$$

pues $$\prod_i(\int_{\mathbb{R} ^n}|\partial_i u|\mathrm{d} x)^{\frac{1}{n}}\leqslant\prod_i(\int_{\mathbb{R} ^n}|\nabla u|\mathrm{d} x)^{\frac{1}{n}}=\int_{\mathbb{R} ^n}|\nabla u|\mathrm{d} x$$.

b) Sean $$u\in C^\infty_0(\mathbb{R} ^n)$$, $$v =|u|^{\frac{p(n-1)}{n}}$$.

<div>
$$\biggl(\int_{\mathbb{R} ^n}|u|^p\mathrm{d} x\biggr)^{\frac{n-1}{n}}=\biggl(\int_{\mathbb{R} ^n}|v|^{\frac{n}{n-1}}\mathrm{d} x\biggr)^{\frac{n-1}{n}}\overset{{\bf a)}}{\leqslant}\frac{1}{2}\int_{\mathbb{R} ^n}(|\nabla v|+|v|)\mathrm{d} x=\frac{p(n-1)}{2n}\int_{\mathbb{R} ^n}|u|^{p'}|\nabla u|\mathrm{d} x+\frac{1}{2}\int_{\mathbb{R} ^n}|u|^{\frac{p(n-1)}{n}}\mathrm{d} x\overset{\text{Hölder}}{\leqslant}\frac{p(n-1)}{2n}\biggl(\int_{\mathbb{R} ^n}|u|^{p'q'}\mathrm{d} x\biggr)^{\frac{1}{q'}}\biggl(\int_{\mathbb{R} ^n}|\nabla u|^{q}\mathrm{d} x\biggr)^{\frac{1}{q}}+\frac{1}{2}\biggl(\int_{\mathbb{R} ^n}|u|^{p'q'}\mathrm{d} x\biggr)^{\frac{1}{q'}}\biggl(\int_{\mathbb{R} ^n}|u|^{q}\mathrm{d} x\biggr)^{\frac{1}{q}}$$
</div>

donde $$\displaystyle \frac{1}{q}+\frac{1}{q'}=1$$ y $$\displaystyle  p'=\frac{p(n-1)}{n}-1$$. Ahora bien, $$\displaystyle  p'q'=\Bigl(\frac{p(n-1)}{n}-1\Bigr)\frac{1}{1-\frac{1}{q}}=\frac{p(n-1)-n}{n}\frac{1}{1-\frac{1}{p}-\frac{1}{n}}=\frac{pn-n-p}{n}\frac{pn}{pn-p-n}=p$$. Como $$\displaystyle \frac{p(n-1)}2{n}=\frac{(n-1)}{2n(\frac{1}{q}-\frac{1}{n})}=\frac{1}{2}\frac{(n-1)}{\frac{n}{q}-1}\geqslant \frac{1}{2}$$,

$$\biggl(\int_{\mathbb{R} ^n}|u|^p\mathrm{d} x\biggr)^{\frac{n-1}{n}}\leqslant\frac{p(n-1)}{2n}\biggl(\int_{\mathbb{R} ^n}|u|^{p'q'}\mathrm{d} x\biggr)^{\frac{1}{q'}}\biggl[\biggl(\int_{\mathbb{R} ^n}|\nabla u|^{q}\mathrm{d} x\biggr)^{\frac{1}{q}}+\biggl(\int_{\mathbb{R} ^n}|u|^{q}\mathrm{d} x\biggr)^{\frac{1}{q}}\biggr]$$

y al dividir por $$\displaystyle \biggl(\int_{\mathbb{R} ^n}|u|^{p'q'}\mathrm{d} x\biggr)^{\frac{1}{q'}}$$, resulta que $$\displaystyle \frac{n-1}{n}-\frac{1}{q'}=\frac{n-1}{n}-1+\frac{1}{q}=\frac{1}{q}-\frac{1}{n}=\frac{1}{p}$$, quedando al final

$$\biggl(\int_{\mathbb{R} ^n}|u|^{p}\mathrm{d} x\biggr)^{\frac{1}{p}}\leqslant\frac{p(n-1)}{2n}\biggl[\biggl(\int_{\mathbb{R} ^n}|\nabla u|^{q}\mathrm{d} x\biggr)^{\frac{1}{q}}+\biggl(\int_{\mathbb{R} ^n}|u|^{q}\mathrm{d} x\biggr)^{\frac{1}{q}}\biggr]$$

como queríamos comprobar.

c) Para $$l$$ entre $$k$$ y $$m$$, sea $$p_l$$ tal que $$\displaystyle \frac{1}{p_l}=\frac{1}{q}-\frac{k-l}{n}$$, teniendo así $$p_k=q$$, $$p_m=p$$. Esta división nos indica que podemos restringirnos al caso $$k=m+1$$, pues de éste se deriva la cadena de inclusiones $$W^{k,q}\subset W^{k-1,p_{k-1}}\subset W^{k-2,p_{k-2}}\subset\cdots W^{m+1,p_{m+1}}\subset W^{m,p}$$.

Sea $$r$$ entero y $$v$$ una función $$C^\infty$$. Entonces se da la desigualdad $$|\nabla|\nabla^r u||\leqslant|\nabla^{r+1}u|$$ pues, mirando $$\nabla^r u$$ como un vector de $$n^r$$ entradas, el primer término mide la variación del módulo mientras que el segundo mide el módulo del vector variación. Aplicando la desigualdad hallada en b), tenemos

$$\|\nabla^r u\|_{L^p}\leqslant A(\|\nabla|\nabla^r u|\|_{L^q}+\|\nabla^r u\|_{L^q})\leqslant A(\|\nabla^{r+1}u\|_{L^q}+\|\nabla^r u\|_{L^q})$$

donde $$A=\frac{p(n-1)}{2n}$$. Al sustituir $$r$$ por $$m$$, $$m-1$$, ... se llega a las desigualdades

$$\|\nabla^m u\|_{L^p}\leqslant A(\|\nabla^{m+1}u\|_{L^q}+\|\nabla^m u\|_{L^q})$$

$$\|\nabla^{m-1} u\|_{L^p}\leqslant A(\|\nabla^{m}u\|_{L^q}+\|\nabla^{m-1} u\|_{L^q})$$

$$\cdots$$

$$\|u\|_{L^p}\leqslant A(\|\nabla u\|_{L^q}+\|u\|_{L^q})$$

y al sumar todo, se obtiene $$\|u\|_{W^{m,p}}\leqslant 2A\|u\|_{W^{k,q}}$$.
