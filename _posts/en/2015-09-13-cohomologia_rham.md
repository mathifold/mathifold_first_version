---
title:  "Idea of the De Rham cohomology"
categories: de_rham_cohomology
langid: rham
mathjax: true
---

Cohomology comes up as a dual answer to homology. Homology identifies the shape of an object finding 'holes'. More concretely, it looks for <i>objects without boundary which are not the boundary of an object</i> (and therefore the definition $$H_k(M)=\text{ker}\partial_n/\text{im}\partial_{n+1}$$ with $$\partial$$ the boundary operator).

{% resource 28.png %}

Cohomology works in a completely different fashion. Instead of looking for subspaces detecting holes, cohomology assigns a real value to each object in our space. For example, in $$\mathbb{R}^2$$ we may assign to each curve (oriented, with startpoint and endpoint) the value of the $$x$$-projection. When the curve moves rightwards, gains projection, whereas loses projection when moving leftwards; that’s good if we want our assignment additive and differentiable: if our curve is divided into several pieces, then it is the same to calculate the value of the whole curve or to add the values of the small ones.

{% resource 30.png %}

The previous example is actually rather simple; it does not matter the whole curve, only the $$x$$-coordinates of the startpoint and endpoint, from which we calculate the difference. Indeed a closed curve has always zero value. Let's consider a less obvious example. In $$\mathbb{R}^2$$ we have a vector field, $$f(x,y)=(y,0)$$. We may perform the following assignment: each curve $$\gamma$$ has value the circulation integral $$\int_{\gamma}f$$. As the picture shows, the value does not depend only on the startpoint and endpoint, because the curves that go up and then go down have a positive circulation, but the curves that go down and then go up have a negative circulation. Moreover, a closed curve has nonzero circulation (in general); in the picture, the small closed curve has slightly negative circulation, because on top it goes in the opposite direction to the field and on bottom it is in the field direction, but the field is stronger in the top.

{% resource 29.png %}

A third example: in $$\mathbb{R} ^2-\{(0,0)\}$$ we consider the assignment <i>swept out central angle</i>. This example resembles the first one. The important data is the start angle and the end angle. And that’s why a little closed curve has zero swept angle. But pay attention! In the second picture there is a curve that encloses the origin and that sweeps an angle of $$2\pi$$, contrary to what we thought about closed curves. This phenomenon is only possible if there are holes in the topological space: we have given zero value to small closed curves, those which are the boundary of a little disc, but other values are allowed for big closed curves, those which perhaps are not the boundary of anything. It is as if we had given values to different homological objects: 0 to the curves not enclosing the origin, $$2\pi$$ to those which circle the origin once, $$4\pi$$ to those which circle the origin twice, and so on.

{% resource 31.png %}

As stated, we want our assignment additive. Therefore we only need to know the value we would assign to, say, little curves, little surface pieces or little volumes. This is done by means of a differential form. Differential forms a local valuation in each point and each direction. 

Differential forms language is well suited for describing these phenomena. The previous three examples are described by three 1-forms in $$\mathbb{R}^2$$: $$\alpha_1=\mathrm{d}x$$, $$\alpha_2=y\mathrm{d}x$$ and $$\alpha_3=\frac{-y}{x^2+y^2}\mathrm{d}x+\frac{x}{x^2+y^2}\mathrm{d}y$$ (please note that the last one is not defined at the origin). De Rham cohomology studies these differential forms and a so called <i>exterior derivative</i> $$\mathrm{d}$$. In the first and third cases, $$\mathrm{d}\alpha_1=\mathrm{d}\alpha_3=0$$ and that's why small closed curves have zero value; we say that $$\alpha_1$$ and $$\alpha_3$$ are <i>closed</i> forms. $$\mathrm{d}\alpha_2\neq 0$$, so $$\alpha_2$$ is not a closed form. On the other hand, $$\alpha_1$$ is <i>exact</i>: $$\alpha_1=\mathrm{d}(x)$$, so $$x$$ is the function to be evaluated in the startpoint and the endpoint, and that's the reason why large closed curves have value zero, because they have the same initial and final point. $$\alpha_3$$ is not exact; we would be delighted to say that $$\alpha_3=\mathrm{d}(angle)$$, but there is not such $$angle$$ function defined in all $$\mathbb{R} ^2-\{(0,0)\}$$, we always fall into $$2\pi$$ steps. 

So for our cohomological search of holes, we must find closed forms which are not exact.
