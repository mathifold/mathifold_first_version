---
title: "Introduction to topological spaces"
categories: topological_spaces
langid: top_spaces_intro
mathjax: true
---

Mathematics are a process of abstraction of ideas. When it comes to topology, the main idea is the one of <i>proximity</i>; and the abstraction process is very clear. Let's see how this process works.

<b><u>The euclidean distance</u></b> (the one we all know)

In real life, to talk about <i>proximity</i> is to talk about distance. And in particular, we usually talk about euclidean distance. This is the distance that we all learnt in our childhoods. When we think about the plane, this distance is given by Pythagoras' theorem (the square of the distance between two points in the plane is equal to the sum of the squares of the distances between the respective coordinates).

A definition that we are all familiar with. What is a circumference? A circumference is <i>the set of points of the plane such that they are all at the same distance of a certain point</i>, which is called the center. And the distnace from the center to any of this points is called the radius.

Suppose that we are talking about points near a ceratin point $$P$$. When we talk about points near to $$P$$, we mean those points whose distance to $$P$$ is less than a reasonable distance, right? Therefore, by points near $$P$$ we understand points that lie <i>inside</i> the circumference of center $$P$$ and radius whatever reasonable distance we have in mind. Example given: we are walking around "Puerta del Sol" in Madrid and we want to know which hotels are near to our current position. Say that near, in this case, is closer than 150 meters. Then, the hotels that are near us are the ones that lie on the blue circle.

{% resource top_spaces-3.png %}

This blue region is what we understand by <i>proximity</i> of our position. And this is the idea that we are interested in. This blue region will be called <i>the euclidean ball centered at Sol with radius 150 meters</i>. This would be a first way to talk about nearness in the plane.

<b><u>Other distances</u></b>

Recall that our aim is to get an abstract concept that generalizes our idea of <i>proximity</i>. Do we have to talk about euclidean distance to talk about proximity? Or is it poissible to talk about it using other distances?

Suppose that we are a cab driver in the city of New York. A client comes in and asks us to take him or her to the nearest underground entrance from the red spot. If we think about the euclidean distance, we would have to take the client to the one in the bottom. But of course, by nearest the client meant the one that would take a smallest trip by car, so that the client would pay as few as possible. Sneaky cab driver! Of course the right one would be the one in the left.

{% resource top_spaces-4.png %}

Therefore, we talk about <i>proximity</i> hear using a different distance. The distance from one point to another is the distance driven by a car to get from the first point to the second point (assuming that all roads go in both directions). This distance is called the cab metric or Manhattan distance. Pretty good name, right?

We have found a new way to talk about points near a certain point in the plane using a different distance. This makes us think. Do we have to talk about a <i>specific</i> distance at all to talk about <i>proximity</i>? The answer is: no. We can talk about the points near a certain point just thinking about an arbitrary distance. Of course, this distance has to be a distance. This means, that the distance between $$a$$ and $$b$$ is always positive; it is zero if and only if $$a=b$$; the distance from $$a$$ to $$b$$ is equal to the distance from $$b$$ to $$a$$; and if we go from $$a$$ to $$b$$ through $$c$$, we hace to walk more than if we go directly from $$a$$ to $$b$$. Makes a lot of sense.

So we have a more abstract way to talk about points near a certain point. A set of points in which there has been defined a distance is called a <i>metric space</i>. The region of points near $$P$$ (say, the ones that are closer to $$P$$ than a radius $$r$$), is called <i>the ball centered at $$P$$ with radius $$r$$</i>. And we can also refer to the nearness of $$P$$ just by any set of points containing a ball centered at $$P$$. This kind of set is called a <i>neighbourhood</i> of $$P$$. The family of all neighbourhoods of $$P$$ verify some properties, that you can check yourself with a pencil and a piece of paper:

1. $$1.$$ $$P$$ is in any neighbourhood of $$P$$
2. $$2.$$ If two people talk about different neighbourhoods of $$P$$, the might not refer to the same set of points. But the common points refered by the two of them are certainly a neighbourhood (this means, the intersection of two neighbourhoods of $$P$$ is another neighbourhood of $$P$$).
3. $$3.$$ If a set contains a neighbourhood of $$P$$, then the set is a neighbourhood of $$P$$
4. $$4.$$ In any neighbourhood of $$P$$ there is always a set of points sufficiently close to $$P$$ such that the neighbourhood of $$P$$ is also a neighbourhood of every point in that set.

This propoerties, that seem to be a tongue twister, will allow us to take the final step in our process of abstraction towards the purest idea of <i>proximity</i>.

<b><u>Who needs distances?</u></b>

Again, with our goal in mind (the idea of <i>proximity</i>), let's take a last step in our abstraction process. We have shown already that we can talk about nearness using an arbitrary distance instead of a specific distance. But do we need any distance at all? The answer is again no. We can talk about <i>proximity</i> without talking about any distance.

You should be impressed and skeptish by now! I wouldn't buy it unless they showed me how to do it. And here's how:

Consider any point $$P$$ in our set of points (you may think of the plane if you want). We define (because we are free to define whatever we want to) a colection of sets of points containing $$P$$ such that they verify the $$4$$ properties above, and we will call every set of this collection a neighbourhood of $$P$$.

We will say that a point is near $$P$$ if there is a neighbourhood of $$P$$ containing that point. What? You don't like it? Okay, okay. I will show you with an example that this actually works!

Suppose that we are trying to say that we are getting closer to the point $$P$$. We have to use the concept of <i>proximity</i> to express this, of course. It is clear that we can express it using distances. If the distance from our position to the point goes to zero as time passes, we are getting closer to the point. But let's forget about distances and express this using our latest idea of <i>proximity</i>, with our home made neighbourhoods.

Given any neighbourhood of $$P$$, there is a moment in time from which we will be lying inside the given neighbourhood.

{% resource top_spaces-5.png %}

We are getting closer to $$P$$! And we managed to express it without using any distance.

We have found an abstract idea of <i>proximity</i>, starting with the intuitive idea that we all have in mind. A set in which for every point we have defined a set of neighbourhoods with the properties above is called a <i>topological space</i>.