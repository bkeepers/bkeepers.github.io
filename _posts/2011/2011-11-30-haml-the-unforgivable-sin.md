---

title: "HAML: the unforgivable sin"
id: 4ecf14a9dabe9d0f2a02a1ec
updated: 2013-06-28T10:05:27-04:00
date: 2011-11-30T08:00:00-05:00
tags:
- code
- popular
- commentary
redirect_from: /blog/archives/2011/11/30/haml-the-unforgivable-sin/
---

[I posted this on twitter](http://twitter.com/#!/bkeepers/status/139360663851106305): "there are many mistakes I'm willing to forgive, but using haml is not one of them". Many people replied asking me to explain why I don't like it, so here it goes…

I used [HAML](http://haml.info/) on several client projects and I hated it every time. There are certainly some things that are nice about it, but overall it is a net loss.

For abstraction's sake
----------------------

Abstractions are a beautiful thing. The goal of an abstraction is to reduce or factor out irrelevant details. Removing details focuses you on the problem at hand and not the underlying implementation.

But an abstraction fails when it doesn't remove the details. HAML is purely an abstraction of syntax. I still have to think about tags, ids and classes while I'm writing HAML. It simply provides a more concise syntax.

So you hate SASS and CoffeeScript too?
--------------------------------------

No. While SASS and CoffeeScript do abstract the syntax of CSS and JavaScript, they provide other great features.

SASS (or even better, SCSS) is a great abstraction because it enables features that would be nearly impossible to maintain by hand. It makes it easier to break your styles up into small, reusable components, and encourages good design patterns.

Likewise, CoffeeScript adds "features" on top of JavaScript that are extremely cumbersome to code by hand. CoffeeScript guards against common coding mistakes, like ensuring variables are properly declared within lexical scope.

Easy to write, hard to read
---------------------------

I agree that HAML is easier to write than HTML, simply because it involves less typing. But I feel it is infinitely harder to read. While the indentation makes it easy to see the nesting, the extremely overloaded synax requires careful attention to each line.

If HAML provided some value other than saving a few keystrokes, I would likely become a believer. But it doesn't.

Typing is not my bottleneck in coding. Thinking is. And forcing my brain to parse HAML when it is occupied by more important things is not conducive to productivity.
