---
layout: post
title: Governance and open source infrastructure
tags:
- opensource
---

There has been a lot of discussion following the [NPM dispute](http://blog.npmjs.org/post/141577284765/kik-left-pad-and-npm) about what the community should/shouldn't be doing. While I agree with most of what has been said, I think there's a deeper issue:

_Open source infrastructure–like GitHub and Node–lacks an adequate model for open source governance._

"Governance" is a fancy word for: who makes decisions, how are those decisions made, and how do actions based on those decisions get carried out? We are most familiar with the concept from our national governments.

But _governance_ applies to things besides nation states. My childhood home had a two-party system that created and enforced the policies that governed our property, money, and citizens. This system was ruled by my mom who wielded most of the power, including the ability to unilaterally create new policies, enforce law and order, rule on disputes amongst the citizens, and imprison anyone on a whim. My dad technically had veto power over everything, but he rarely exercised. None of this was written in law books, but it was still a governance system.

Governance is especially important for shared resources that are, what economists call, _rivalrous_. If my use of a resource can interfere with your use of a resource, then it is rivalrous. A banana is rivalrous; if I eat it, then you can't also eat it. Wifi is less rivalrous; you and I can generally consume it without interfering with each other–up to a certain point. Ideas are non-rivalrous, or even anti-rivalrous; no matter how many ideas I come up with, I can't deprive you of ideas, and usually sharing our ideas leads to more ideas.

Rivalrous resources are governed by creating constraints, usually by charging us to use them, penalizing us for abusing them, or delegating governance of specific resources to others. Property is a form of governance that assigns ownership as a way of dealing with rivalry. I pay the state of Michigan every year for exclusive ownership of a piece of land, and it's mostly up to me to decide who else can use it and what they can do with it–with some limitations.

Copyright is a form of _intellectual_ property and attempts to protect my creations from rivalry. If I create something, I own it and control who is allowed to make copies of it. This ability to exclude people from copying my creation means nobody can make loads of money by selling it or devalue it by giving it away for free.

Open source software turns this notion of copyright upside down, using a _license_ to give everyone the right to copy and use my software.  I still technically _own_ the copyright, but I've given up my rights to control who can use it.

But hold on a second…if copyright protects intellectual creations from rivalry by limiting who can copy them, and open source licenses give everyone the right to use and copy the software, what is left to govern?

In [The Success of Open Source](http://amzn.to/1q5DS8G), Steven Weber explains it like this:

> The conventional notion of property is, of course, the right to exclude you from using something that belongs to me. Property in open source is configured fundamentally around the right to distribute, not the right to exclude. If that sentence feels awkward on first reading, that is a testimony to just how deeply embedded in our intuitions and institutions the exclusion view of property really is.
>
> Open source is an experiment in building a political economy-that is, a system of sustainable value creation and a set of governance mechanisms. In this case it is a governance system that holds together a community of producers around this counterintuitive notion of property rights as distribution.

Open source governance is about holding together a community of producers around a distribution, for better, for worse, for richer, for poorer, in sickness and in health, until a fork do us part.

## Distribution

{TODO: What is "distribution"?}

{TODO: Why does it matter if there's only one distribution?}

## Foundations

[Foundations](http://flossfoundations.org/foundation-directory) are one solution to governance. They are non-profit legal entities (501C* in the U.S. tax code) that own all of the intellectual property and assets of a project or group, offer guidance for setting up structures for decision making, and provide other critical resources. They play an important role in creating neutral ground when competing organizations have shared interests in vital projects. 

Some argue that foundations are the only adequate solution to governance in open source. But they are a heavy-handed solution, and more importantly, they are not scalable.

There are millions of open source projects and growing. Every single one of them can't be under the governance of a foundation, nor should they. For any governance system to be effective, someone actually has to govern. So in a world where millions of open source projects are part of a foundation, or, millions of foundations, who or what is doing the governing?

when I send my yearly dues in to my foundations of choice, what am I buying?

For charities, I'm buying, or rather supporting, a world view.

## Inherent Governance

In Nadia Eghbal's post titled [There is no “my” in open source](https://medium.com/@nayafia/there-is-no-my-in-open-source-c3e5555390fa), she quotes a conversation that she had with Karl Fogel that looks at this notion of property from a different angle:

> We don’t have the right language to express when “my” indicates possession versus association. When we say: “that’s my bike” or “those are my shoes”, we mean that we own them. We have the final say in decisions about our bike. But when we say “that’s my father” or “my sister”, what we mean is we are associated with them. We obviously don’t possess them.
>
> In open source, you can only have “my” in the associative sense. There is no possessive “my” in open source.”

I like how Karl frames this issue, but "my father" and "my sister" don't acknowledge the original property rights of the creator. I didn't create "my father" or "my sister". They were here when I arrived. "my child" is a more appropriate analogy.

My parents created me and had governance over me for many years. But because I was born into a larger system–these United States, the state of Iowa, and a community of friends–their governance over me had constraints. The nation didn't permit them to kill me. The state didn't permit them to abuse me. Their friends didn't permit them to deprive me. Their ability to procreate granted them limited governance over me, and it became even more limited as I got older. A guilt trip is the only effective mechanism of governance that remains to them.

This is the notion that I think our open source infrastructure is missing. A form of governance that acknowledges that once I share an open source project with the world, it is no longer "my" in the possessive sense, but "my" in the associative sense. I still own the property, but I have waived my right to exclude people from it. As it matures, it becomes less and less "my". Someday it will hopefully graduate, move out of my house, maybe go to a foundation (or maybe not), and become a part of a greater community.

So what do we do in light of the NPM incident? We do what the open source community does best: define standards and build tools. Specifically, I think open source infrastructure like GitHub and NPM need a model for open source governance, and their model should be shared.



[NPM's unpublish policy](http://blog.npmjs.org/post/141905368000/changes-to-npms-unpublish-policy) is a good first step.
